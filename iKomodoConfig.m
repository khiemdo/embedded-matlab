function iKomodoConfig(block)
setup(block);

function setup(block)
% Register number of ports
block.NumInputPorts  = 1;
block.NumOutputPorts = 1;

% Setup port properties to be inherited or dynamic
block.SetPreCompInpPortInfoToDynamic;
block.SetPreCompOutPortInfoToDynamic;

block.InputPort(1).Dimensions        = 1;
block.InputPort(1).DatatypeID        = 6; % int32
block.InputPort(1).DirectFeedthrough = false;
  
block.OutputPort(1).Dimensions       = 1;
block.OutputPort(1).DatatypeID  = 6;  % int32
block.OutputPort(1).Complexity  = 'Real';

% Register parameters
block.NumDialogPrms     = 2;

% Register sample times
%  [0 offset]            : Continuous sample time
%  [positive_num offset] : Discrete sample time
%
%  [-1, 0]               : Inherited sample time
%  [-2, 0]               : Variable sample time
block.SampleTimes = [-1 0];

% Specify the block simStateCompliance. The allowed values are:
%    'UnknownSimState', < The default setting; warn and assume DefaultSimState
%    'DefaultSimState', < Same sim state as a built-in block
%    'HasNoSimState',   < No sim state
%    'CustomSimState',  < Has GetSimState and SetSimState methods
%    'DisallowSimState' < Error out when saving or restoring the model sim state
block.SimStateCompliance = 'DefaultSimState';

%% -----------------------------------------------------------------
%% The MATLAB S-function uses an internal registry for all
%% block methods. You should register all relevant methods
%% (optional and required) as illustrated below. You may choose
%% any suitable name for the methods and implement these methods
%% as local functions within the same file. See comments
%% provided for each function for more information.
%% -----------------------------------------------------------------

    block.RegBlockMethod('PostPropagationSetup',    @DoPostPropSetup);
    block.RegBlockMethod('Start', @Start);
    block.RegBlockMethod('Update', @Update);  
    block.RegBlockMethod('Outputs', @Outputs);     % Required
    block.RegBlockMethod('Terminate', @Terminate); % Required

%end setup

%%
%% PostPropagationSetup:
%%   Functionality    : Setup work areas and state variables. Can
%%                      also register run-time methods here
%%   Required         : No
%%   C-Mex counterpart: mdlSetWorkWidths
%%
function DoPostPropSetup(block)
block.NumDworks = 1;
  
  block.Dwork(1).Name            = 'kHandle';
  block.Dwork(1).Dimensions      = 1;
  block.Dwork(1).DatatypeID      = 6;      % double
  block.Dwork(1).Complexity      = 'Real'; % real
  block.Dwork(1).UsedAsDiscState = true;


%%
%% Start:
%%   Functionality    : Called once at start of model execution. If you
%%                      have states that should be initialized once, this 
%%                      is the place to do it.
%%   Required         : No
%%   C-MEX counterpart: mdlStart
%%
function Start(block)
    portName = block.DialogPrm(1).Data;
    baudrate = block.DialogPrm(2).Data;
    block.Dwork(1).Data = int32(0);
    
    if not(libisloaded('komodo'))
        ret = loadlibrary('komodo.dll','komodo.h','mfilename','komodoMatlab')
    end
    kHandle = calllib('komodo','c_km_open',portName);
    %hex2dec('20') = KM_FEATURE_CAN_A_CONFIG, hex2dec('10') = KM_FEATURE_CAN_A_CONTROL
    ret = calllib('komodo','c_km_acquire',kHandle, hex2dec('20'));
    ret = calllib('komodo','c_km_acquire',kHandle, hex2dec('10'));
    ret = calllib('komodo','c_km_acquire',kHandle, hex2dec('8'));
    ret = calllib('komodo','c_km_can_bitrate',kHandle,'KM_CAN_CH_A',baudrate);%Set bitrate
    ret = calllib('komodo','c_km_can_target_power',kHandle,'KM_CAN_CH_A','KM_TARGET_POWER_ON');%Set bitrate

    ret = calllib('komodo','c_km_enable',kHandle);

    block.Dwork(1).Data = int32(kHandle);
    
%end Start

%%
%% Outputs:
%%   Functionality    : Called to generate block outputs in
%%                      simulation step
%%   Required         : Yes
%%   C-MEX counterpart: mdlOutputs
%%
function Outputs(block)

block.OutputPort(1).Data = block.Dwork(1).Data;

%end Outputs

function Update(block)
  
%endfunction

%%
%% Terminate:
%%   Functionality    : Called at the end of simulation for cleanup
%%   Required         : Yes
%%   C-MEX counterpart: mdlTerminate
%%
function Terminate(block)
    calllib('komodo','c_km_disable',block.Dwork(1).Data);
    calllib('komodo','c_km_can_target_power',block.Dwork(1).Data,'KM_CAN_CH_A','KM_TARGET_POWER_OFF');%Set bitrate
    calllib('komodo', 'c_km_close', block.Dwork(1).Data);
%end Terminate


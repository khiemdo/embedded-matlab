function iKReadCanMsg(block)
setup(block);

function setup(block)
% Register number of ports
block.NumInputPorts  = 1;
block.NumOutputPorts = 3;

% Setup port properties to be inherited or dynamic
block.SetPreCompInpPortInfoToDynamic;
block.SetPreCompPortInfoToDefaults;

block.InputPort(1).Dimensions        = 1;
block.InputPort(1).DatatypeID        = -1; 
block.InputPort(1).DirectFeedthrough = false;

% struct km_can_info_t {
%     u64 timestamp;u32 status;u32 events;
%     km_can_ch_t channel;u32 bitrate_hz;
%     u08 host_gen;u08 rx_error_count;
%     u08 tx_error_count;u32 overflow_count;};
block.OutputPort(1).Dimensions       = 9;
block.OutputPort(1).DatatypeID  = 7;  % uint32
block.OutputPort(1).Complexity  = 'Real';

% struct km_can_packet_t {
%     u08 remote_req;u08 extend_addr;u08 dlc;u32 id;};
block.OutputPort(2).Dimensions       = 4;
block.OutputPort(2).DatatypeID  = 7;  % uint32
block.OutputPort(2).Complexity  = 'Real';

block.OutputPort(3).Dimensions       = 8;
block.OutputPort(3).DatatypeID  = 3;  % uint8
block.OutputPort(3).Complexity  = 'Real';

% Register parameters
block.NumDialogPrms     = 0;

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

    block.RegBlockMethod('PostPropagationSetup',    @DoPostPropSetup);
    block.RegBlockMethod('Start', @Start);
    block.RegBlockMethod('Update', @Update);  
    block.RegBlockMethod('Outputs', @Outputs);     % Required
    block.RegBlockMethod('Terminate', @Terminate); % Required

%end setup

function DoPostPropSetup(block)
block.NumDworks = 1;
  
  block.Dwork(1).Name            = 'x0';
  block.Dwork(1).Dimensions      = 1;
  block.Dwork(1).DatatypeID      = 6;      % int32
  block.Dwork(1).Complexity      = 'Real'; % real
  block.Dwork(1).UsedAsDiscState = true;

%end DoPostPropSetup

function Start(block)
    block.Dwork(1).Data = block.InputPort(1).Data;;
%end Start

function Outputs(block)
    kHandle = block.InputPort(1).Data;
    info = libstruct('km_can_info_t');
    set(info,'timestamp',0,'status',1,'events',0,'channel',0,'bitrate_hz',0,'host_gen',0,'rx_error_count',0,'tx_error_count',0,'overflow_count',0)

    pkt = libstruct('km_can_packet_t');
    set(pkt,'remote_req',0,'extend_addr',0,'dlc',0,'id',0)
    
    dataIn = zeros(1,8);
    [~,info,pkt,dataIn]=calllib('komodo', 'c_km_can_read', kHandle, info, pkt, 8, dataIn);

    if eq(info.status,0 ) 
        fieldNames = fieldnames(info); 
        for n = 1:numel(fieldNames) 
            
            if(n==4||n==5||n==6)
                continue
            end
            block.OutputPort(1).Data(n) = uint32(info.(fieldNames{n}));
        end
        fieldNames = fieldnames(pkt); 
        for n = 1:numel(fieldNames) 
            block.OutputPort(2).Data(n) = uint32(pkt.(fieldNames{n}));
        end
        block.OutputPort(3).Data = uint8(dataIn);
    end
%end Outputs

function Update(block)
  
%endfunction

function Terminate(block)

%end Terminate


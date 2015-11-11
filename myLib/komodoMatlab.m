function [methodinfo,structs,enuminfo,ThunkLibName]=komodoMatlab
%KOMODOMATLAB Create structures to define interfaces found in 'komodo'.

%This function was generated by loadlibrary.m parser version  on Fri Nov  6 22:26:29 2015
%perl options:'komodo.i -outfile=komodoMatlab.m -thunkfile=komodo_thunk_pcwin64.c -header=komodo.h'
ival={cell(1,0)}; % change 0 to the actual number of functions to preallocate the data.
structs=[];enuminfo=[];fcnNum=1;
fcns=struct('name',ival,'calltype',ival,'LHS',ival,'RHS',ival,'alias',ival,'thunkname', ival);
MfilePath=fileparts(mfilename('fullpath'));
ThunkLibName=fullfile(MfilePath,'komodo_thunk_pcwin64');
% int c_km_find_devices ( int num_ports , u16 * ports ); 
fcns.thunkname{fcnNum}='int32int32voidPtrThunk';fcns.name{fcnNum}='c_km_find_devices'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'uint16Ptr'};fcnNum=fcnNum+1;
% int c_km_find_devices_ext ( int num_ports , u16 * ports , int num_ids , u32 * unique_ids ); 
fcns.thunkname{fcnNum}='int32int32voidPtrint32voidPtrThunk';fcns.name{fcnNum}='c_km_find_devices_ext'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'uint16Ptr', 'int32', 'ulongPtr'};fcnNum=fcnNum+1;
% Komodo c_km_open ( int port_number ); 
fcns.thunkname{fcnNum}='int32int32Thunk';fcns.name{fcnNum}='c_km_open'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32'};fcnNum=fcnNum+1;
% Komodo c_km_open_ext ( int port_number , KomodoExt * km_ext ); 
fcns.thunkname{fcnNum}='int32int32voidPtrThunk';fcns.name{fcnNum}='c_km_open_ext'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'KomodoExtPtr'};fcnNum=fcnNum+1;
% int c_km_close ( Komodo komodo ); 
fcns.thunkname{fcnNum}='int32int32Thunk';fcns.name{fcnNum}='c_km_close'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32'};fcnNum=fcnNum+1;
% int c_km_port ( Komodo komodo ); 
fcns.thunkname{fcnNum}='int32int32Thunk';fcns.name{fcnNum}='c_km_port'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32'};fcnNum=fcnNum+1;
% int c_km_features ( Komodo komodo ); 
fcns.thunkname{fcnNum}='int32int32Thunk';fcns.name{fcnNum}='c_km_features'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32'};fcnNum=fcnNum+1;
% u32 c_km_unique_id ( Komodo komodo ); 
fcns.thunkname{fcnNum}='ulongint32Thunk';fcns.name{fcnNum}='c_km_unique_id'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='ulong'; fcns.RHS{fcnNum}={'int32'};fcnNum=fcnNum+1;
% const char * c_km_status_string ( int status ); 
fcns.thunkname{fcnNum}='cstringint32Thunk';fcns.name{fcnNum}='c_km_status_string'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='cstring'; fcns.RHS{fcnNum}={'int32'};fcnNum=fcnNum+1;
% int c_km_version ( Komodo komodo , KomodoVersion * version ); 
fcns.thunkname{fcnNum}='int32int32voidPtrThunk';fcns.name{fcnNum}='c_km_version'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'KomodoVersionPtr'};fcnNum=fcnNum+1;
% u32 c_km_sleep_ms ( u32 milliseconds ); 
fcns.thunkname{fcnNum}='ulongulongThunk';fcns.name{fcnNum}='c_km_sleep_ms'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='ulong'; fcns.RHS{fcnNum}={'ulong'};fcnNum=fcnNum+1;
% int c_km_acquire ( Komodo komodo , u32 features ); 
fcns.thunkname{fcnNum}='int32int32ulongThunk';fcns.name{fcnNum}='c_km_acquire'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'ulong'};fcnNum=fcnNum+1;
% int c_km_release ( Komodo komodo , u32 features ); 
fcns.thunkname{fcnNum}='int32int32ulongThunk';fcns.name{fcnNum}='c_km_release'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'ulong'};fcnNum=fcnNum+1;
% int c_km_timeout ( Komodo komodo , u32 timeout_ms ); 
fcns.thunkname{fcnNum}='int32int32ulongThunk';fcns.name{fcnNum}='c_km_timeout'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'ulong'};fcnNum=fcnNum+1;
% int c_km_can_query_bus_state ( Komodo komodo , km_can_ch_t channel , u08 * bus_state , u08 * rx_error , u08 * tx_error ); 
fcns.thunkname{fcnNum}='int32int32km_can_ch_tvoidPtrvoidPtrvoidPtrThunk';fcns.name{fcnNum}='c_km_can_query_bus_state'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'km_can_ch_t', 'uint8Ptr', 'uint8Ptr', 'uint8Ptr'};fcnNum=fcnNum+1;
% int c_km_latency ( Komodo komodo , u32 latency_ms ); 
fcns.thunkname{fcnNum}='int32int32ulongThunk';fcns.name{fcnNum}='c_km_latency'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'ulong'};fcnNum=fcnNum+1;
% int c_km_can_configure ( Komodo komodo , u32 config ); 
fcns.thunkname{fcnNum}='int32int32ulongThunk';fcns.name{fcnNum}='c_km_can_configure'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'ulong'};fcnNum=fcnNum+1;
% int c_km_can_bus_timeout ( Komodo komodo , km_can_ch_t channel , u16 timeout_ms ); 
fcns.thunkname{fcnNum}='int32int32km_can_ch_tuint16Thunk';fcns.name{fcnNum}='c_km_can_bus_timeout'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'km_can_ch_t', 'uint16'};fcnNum=fcnNum+1;
% int c_km_can_bitrate ( Komodo komodo , km_can_ch_t channel , u32 bitrate_hz ); 
fcns.thunkname{fcnNum}='int32int32km_can_ch_tulongThunk';fcns.name{fcnNum}='c_km_can_bitrate'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'km_can_ch_t', 'ulong'};fcnNum=fcnNum+1;
% int c_km_can_auto_bitrate ( Komodo komodo , km_can_ch_t channel ); 
fcns.thunkname{fcnNum}='int32int32km_can_ch_tThunk';fcns.name{fcnNum}='c_km_can_auto_bitrate'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'km_can_ch_t'};fcnNum=fcnNum+1;
% int c_km_can_auto_bitrate_ext ( Komodo komodo , km_can_ch_t channel , u32 num_bitrates_hz , const u32 * bitrates_hz ); 
fcns.thunkname{fcnNum}='int32int32km_can_ch_tulongvoidPtrThunk';fcns.name{fcnNum}='c_km_can_auto_bitrate_ext'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'km_can_ch_t', 'ulong', 'ulongPtr'};fcnNum=fcnNum+1;
% int c_km_get_samplerate ( Komodo komodo ); 
fcns.thunkname{fcnNum}='int32int32Thunk';fcns.name{fcnNum}='c_km_get_samplerate'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32'};fcnNum=fcnNum+1;
% int c_km_can_target_power ( Komodo komodo , km_can_ch_t channel , km_power_t power ); 
fcns.thunkname{fcnNum}='int32int32km_can_ch_tkm_power_tThunk';fcns.name{fcnNum}='c_km_can_target_power'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'km_can_ch_t', 'km_power_t'};fcnNum=fcnNum+1;
% int c_km_enable ( Komodo komodo ); 
fcns.thunkname{fcnNum}='int32int32Thunk';fcns.name{fcnNum}='c_km_enable'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32'};fcnNum=fcnNum+1;
% int c_km_disable ( Komodo komodo ); 
fcns.thunkname{fcnNum}='int32int32Thunk';fcns.name{fcnNum}='c_km_disable'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32'};fcnNum=fcnNum+1;
% int c_km_can_read ( Komodo komodo , km_can_info_t * info , km_can_packet_t * pkt , int num_bytes , u08 * data ); 
fcns.thunkname{fcnNum}='int32int32voidPtrvoidPtrint32voidPtrThunk';fcns.name{fcnNum}='c_km_can_read'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'km_can_info_tPtr', 'km_can_packet_tPtr', 'int32', 'uint8Ptr'};fcnNum=fcnNum+1;
% int c_km_can_async_submit ( Komodo komodo , km_can_ch_t channel , u08 flags , const km_can_packet_t * pkt , int num_bytes , const u08 * data ); 
fcns.thunkname{fcnNum}='int32int32km_can_ch_tuint8voidPtrint32voidPtrThunk';fcns.name{fcnNum}='c_km_can_async_submit'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'km_can_ch_t', 'uint8', 'km_can_packet_tPtr', 'int32', 'uint8Ptr'};fcnNum=fcnNum+1;
% int c_km_can_async_collect ( Komodo komodo , u32 timeout_ms , u32 * arbitration_count ); 
fcns.thunkname{fcnNum}='int32int32ulongvoidPtrThunk';fcns.name{fcnNum}='c_km_can_async_collect'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'ulong', 'ulongPtr'};fcnNum=fcnNum+1;
% int c_km_can_write ( Komodo komodo , km_can_ch_t channel , u08 flags , const km_can_packet_t * pkt , int num_bytes , const u08 * data , u32 * arbitration_count ); 
fcns.thunkname{fcnNum}='int32int32km_can_ch_tuint8voidPtrint32voidPtrvoidPtrThunk';fcns.name{fcnNum}='c_km_can_write'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'km_can_ch_t', 'uint8', 'km_can_packet_tPtr', 'int32', 'uint8Ptr', 'ulongPtr'};fcnNum=fcnNum+1;
% int c_km_gpio_config_in ( Komodo komodo , u08 pin_number , u08 bias , u08 trigger ); 
fcns.thunkname{fcnNum}='int32int32uint8uint8uint8Thunk';fcns.name{fcnNum}='c_km_gpio_config_in'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'uint8', 'uint8', 'uint8'};fcnNum=fcnNum+1;
% int c_km_gpio_config_out ( Komodo komodo , u08 pin_number , u08 drive , u08 source ); 
fcns.thunkname{fcnNum}='int32int32uint8uint8uint8Thunk';fcns.name{fcnNum}='c_km_gpio_config_out'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'uint8', 'uint8', 'uint8'};fcnNum=fcnNum+1;
% int c_km_gpio_set ( Komodo komodo , u08 value , u08 mask ); 
fcns.thunkname{fcnNum}='int32int32uint8uint8Thunk';fcns.name{fcnNum}='c_km_gpio_set'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'uint8', 'uint8'};fcnNum=fcnNum+1;
% int c_km_gpio_get ( Komodo komodo ); 
fcns.thunkname{fcnNum}='int32int32Thunk';fcns.name{fcnNum}='c_km_gpio_get'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32'};fcnNum=fcnNum+1;
structs.KomodoVersion.members=struct('software', 'uint16', 'firmware', 'uint16', 'hardware', 'uint16', 'fw_revs_for_sw', 'ulong', 'hw_revs_for_sw', 'ulong', 'api_req_by_sw', 'uint16');
structs.KomodoExt.members=struct('version', 'KomodoVersion', 'features', 'ulong');
structs.km_can_info_t.members=struct('timestamp', 'uint64', 'status', 'ulong', 'events', 'ulong', 'channel', 'km_can_ch_t', 'bitrate_hz', 'ulong', 'host_gen', 'uint8', 'rx_error_count', 'uint8', 'tx_error_count', 'uint8', 'overflow_count', 'ulong');
structs.km_can_packet_t.members=struct('remote_req', 'uint8', 'extend_addr', 'uint8', 'dlc', 'uint8', 'id', 'ulong');
enuminfo.km_pin_bias_t=struct('KM_PIN_BIAS_TRISTATE',0,'KM_PIN_BIAS_PULLUP',1,'KM_PIN_BIAS_PULLDOWN',2);
enuminfo.km_pin_source_t=struct('KM_PIN_SRC_SOFTWARE_CTL',0,'KM_PIN_SRC_ALL_ERR_CAN_A',17,'KM_PIN_SRC_BIT_ERR_CAN_A',18,'KM_PIN_SRC_FORM_ERR_CAN_A',19,'KM_PIN_SRC_STUFF_ERR_CAN_A',20,'KM_PIN_SRC_OTHER_ERR_CAN_A',21,'KM_PIN_SRC_ALL_ERR_CAN_B',33,'KM_PIN_SRC_BIT_ERR_CAN_B',34,'KM_PIN_SRC_FORM_ERR_CAN_B',35,'KM_PIN_SRC_STUFF_ERR_CAN_B',36,'KM_PIN_SRC_OTHER_ERR_CAN_B',37,'KM_PIN_SRC_ALL_ERR_CAN_BOTH',49,'KM_PIN_SRC_BIT_ERR_CAN_BOTH',50,'KM_PIN_SRC_FORM_ERR_CAN_BOTH',51,'KM_PIN_SRC_STUFF_ERR_CAN_BOTH',52,'KM_PIN_SRC_OTHER_ERR_CAN_BOTH',53);
enuminfo.km_pin_trigger_t=struct('KM_PIN_TRIGGER_NONE',0,'KM_PIN_TRIGGER_RISING_EDGE',1,'KM_PIN_TRIGGER_FALLING_EDGE',2,'KM_PIN_TRIGGER_BOTH_EDGES',3);
enuminfo.km_power_t=struct('KM_TARGET_POWER_QUERY',2,'KM_TARGET_POWER_OFF',0,'KM_TARGET_POWER_ON',1);
enuminfo.km_pin_drive_t=struct('KM_PIN_DRIVE_NORMAL',0,'KM_PIN_DRIVE_INVERTED',1,'KM_PIN_DRIVE_OPEN_DRAIN',2,'KM_PIN_DRIVE_OPEN_DRAIN_PULLUP',3);
enuminfo.km_can_ch_t=struct('KM_CAN_CH_A',0,'KM_CAN_CH_B',1);
enuminfo.km_status_t=struct('KM_OK',0,'KM_UNABLE_TO_LOAD_LIBRARY',-1,'KM_UNABLE_TO_LOAD_DRIVER',-2,'KM_UNABLE_TO_LOAD_FUNCTION',-3,'KM_INCOMPATIBLE_LIBRARY',-4,'KM_INCOMPATIBLE_DEVICE',-5,'KM_COMMUNICATION_ERROR',-6,'KM_UNABLE_TO_OPEN',-7,'KM_UNABLE_TO_CLOSE',-8,'KM_INVALID_HANDLE',-9,'KM_CONFIG_ERROR',-10,'KM_PARAM_ERROR',-11,'KM_FUNCTION_NOT_AVAILABLE',-12,'KM_FEATURE_NOT_ACQUIRED',-13,'KM_NOT_DISABLED',-14,'KM_NOT_ENABLED',-15,'KM_CAN_READ_EMPTY',-101,'KM_CAN_SEND_TIMEOUT',-102,'KM_CAN_SEND_FAIL',-103,'KM_CAN_ASYNC_EMPTY',-104,'KM_CAN_ASYNC_MAX_REACHED',-105,'KM_CAN_ASYNC_PENDING',-106,'KM_CAN_ASYNC_TIMEOUT',-107,'KM_CAN_AUTO_BITRATE_FAIL',-108);
methodinfo=fcns;
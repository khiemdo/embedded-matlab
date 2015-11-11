%*******************	LOAD LIBRARY	******************
loadlibrary('komodo.dll',['komodo.h'],'mfilename','komodoMatlab')
%libfunctions komodo
%libfunctionsview komodo

%*******************	FIND DEVICES	******************
nelem = 16
portsPtr=libpointer('uint16Ptr', zeros(1,16));
uniqueIdsPtr=libpointer('ulongPtr', zeros(1,16));
calllib('komodo','c_km_find_devices',nelem, portsPtr)
calllib('komodo','c_km_find_devices_ext',nelem, portsPtr, nelem, uniqueIdsPtr)
portsPtr.Value
uniqueIdsPtr.Value

%*******************	INITIALIZATION	******************
kHandle = calllib('komodo','c_km_open',0);
%hex2dec('20') = KM_FEATURE_CAN_A_CONFIG, hex2dec('10') = KM_FEATURE_CAN_A_CONTROL
calllib('komodo','c_km_acquire',kHandle, hex2dec('20'))
calllib('komodo','c_km_acquire',kHandle, hex2dec('10'))
calllib('komodo','c_km_acquire',kHandle, hex2dec('8'))
calllib('komodo','c_km_can_bitrate',kHandle,'KM_CAN_CH_A',1000000)%Set bitrate
calllib('komodo','c_km_can_target_power',kHandle,'KM_CAN_CH_A','KM_TARGET_POWER_ON')%Set bitrate

calllib('komodo','c_km_enable',kHandle)


%*******************	SEND DATA	******************
%int c_km_can_write (
%    Komodo                  komodo,
%    km_can_ch_t             channel,
%    u08                     flags,
%    const km_can_packet_t * pkt,
%    int                     num_bytes,
%    const u08 *             data,
%    u32 *                   arbitration_count
%);
%km_can_write(kma, KM_CAN_CH_A, 0, &pkt, data_len, data_out, arb_count);
KM_CAN_CH_A=0;
dataLen = 8;

pkt1 = libstruct('km_can_packet_t')
set(pkt1,'remote_req',0,'extend_addr',0,'dlc',8,'id',1)

pkt.remote_req=0;
pkt.extend_addr=0;
pkt.dlc=dataLen;
pkt.id=1;
pkt2 = libstruct('km_can_packet_t',pkt)

canCC=libpointer('km_can_ch_t');

dataOut = [ 1, 2, 3, 4, 5, 6, 7, 8 ];
arbCount = zeros(1,8)


dataLen = 8;
dataOut = [ 1, 2, 3, 4, 5, 6, 7, 8 ];
pkt1 = 0;
arbCount=0;
calllib('komodo', 'c_km_can_write', kHandle, 'KM_CAN_CH_A', 0, pkt1, dataLen, dataOut, arbCount)

calllib('komodo', 'c_km_can_write', kHandle, 'KM_CAN_CH_A', 0, pkt1, dataLen, dataOut, arbCount)
calllib('komodo', 'c_km_can_write', kHandle, 0, 0, pkt2, 8, dataOut, arbCount)
calllib('komodo', 'c_km_can_write', kHandle, 0, 0, pkt, 8, dataOut, dataOut)
%When you pass a MATLAB® structure to an external library function:
%   +Every MATLAB field name must match a field name in the library structure definition. Field names are case-sensitive.
%   +MATLAB structures cannot contain fields that are not in the library structure definition.
%   +If a MATLAB structure contains fewer fields than defined in the library structure, MATLAB sets undefined fields to zero.
calllib('komodo', 'c_km_can_write', kHandle, 0, 0, pkt, 8, dataOut1, arbCount1)

%*******************	READ DATA	******************
info1 = libstruct('km_can_info_t')
set(info1,'timestamp',0,'status',0,'events',0,'channel',0,'bitrate_hz',0,'host_gen',0,'rx_error_count',0,'tx_error_count',0,'overflow_count',0)

info2.timestamp=0;
info2.status=0;
info2.events=0;
info2.channel=0;
info2.bitrate_hz=0;
info2.host_gen=0;
info2.rx_error_count=0;
info2.tx_error_count=0;
info2.overflow_count=0;
info3 = libstruct('km_can_info_t',info2)

dataIn1 = zeros(1,8);
dataIn2 = zeros(1,8);
retKHandle=0;retInfo = 0; retPkt = 0; retDataIn1=zeros(1,8);
[retKHandle,retInfo,retPkt,retDataIn1] = calllib('komodo', 'c_km_can_read', kHandle, info1, pkt1, 8, retDataIn1)
calllib('komodo', 'c_km_can_read', kHandle, info3, pkt1, 8, dataIn1)

ret = 0;
while eq(ret,0)
   ret =  calllib('komodo', 'c_km_can_read', kHandle, info1, pkt1, 8, dataIn1);
end

info1 = libstruct('km_can_info_t')
pkt1 = libstruct('km_can_packet_t')

dataLen = 0;
dataIn1 = 0;

ret = 0;
while eq(ret,0)
   ret =  calllib('komodo', 'c_km_can_read', kHandle, info1, pkt1, 8, dataIn1);
end

calllib('komodo', 'c_km_can_read', kHandle, info1, pkt1, dataLen, dataIn1)

calllib('komodo','c_km_can_target_power',kHandle,'KM_CAN_CH_A','KM_TARGET_POWER_OFF')%Set bitrate
calllib('komodo','c_km_disable',kHandle)
calllib('komodo', 'c_km_close', kHandle)




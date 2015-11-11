function [ retF ] = SendCANMsg( kHandle, canID, dataOut )
    dlc = size(dataOut);
    dlc = dlc(2);
    pkt1 = libstruct('km_can_packet_t');
    set(pkt1,'remote_req',0,'extend_addr',0,'dlc',dlc,'id',canID);
    arbCount=0;
    ret = calllib('komodo', 'c_km_can_write', kHandle, 'KM_CAN_CH_A', 0, pkt1, dlc, dataOut, arbCount);
    if nargout
        retF=ret;
    end
end

%SendCANMsg(kHandle,11,dataOut)
function [ retF, info, pkt, dataIn ] = ReadCanMsg( kHandle )
    info = libstruct('km_can_info_t');
    set(info,'timestamp',0,'status',0,'events',0,'channel',0,'bitrate_hz',0,'host_gen',0,'rx_error_count',0,'tx_error_count',0,'overflow_count',0)

    pkt = libstruct('km_can_packet_t');
    set(pkt,'remote_req',0,'extend_addr',0,'dlc',0,'id',0)
    
    dataIn = zeros(1,8);
    [~,info,pkt,dataIn]=calllib('komodo', 'c_km_can_read', kHandle, info, pkt, 8, dataIn);

    if eq(info.status,0 )
        retF = 0;        
    else
        retF = -1;
    end
end


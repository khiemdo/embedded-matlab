function kHandle = KomodoInitialize(portName, baudrate)
    if not(libisloaded('komodoMatlab'))
        loadlibrary('komodo.dll',['komodo.h'],'mfilename','komodoMatlab')
    end

    kHandle = calllib('komodo','c_km_open',portName);
    %hex2dec('20') = KM_FEATURE_CAN_A_CONFIG, hex2dec('10') = KM_FEATURE_CAN_A_CONTROL
    calllib('komodo','c_km_acquire',kHandle, hex2dec('20'))
    calllib('komodo','c_km_acquire',kHandle, hex2dec('10'))
    calllib('komodo','c_km_acquire',kHandle, hex2dec('8'))
    calllib('komodo','c_km_can_bitrate',kHandle,'KM_CAN_CH_A',baudrate)%Set bitrate
    calllib('komodo','c_km_can_target_power',kHandle,'KM_CAN_CH_A','KM_TARGET_POWER_ON')%Set bitrate

    calllib('komodo','c_km_enable',kHandle)

end
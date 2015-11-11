function [ ] = KomodoClose( kHandle )
    calllib('komodo','c_km_can_target_power',kHandle,'KM_CAN_CH_A','KM_TARGET_POWER_OFF')%Set bitrate
    calllib('komodo','c_km_disable',kHandle)
    calllib('komodo', 'c_km_close', kHandle)
end


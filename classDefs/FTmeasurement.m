classdef FTmeasurement < InstrumentClass
    % Strain gauge-based force/torque measurement istrument
    properties
        calibration % Volts per N/Nm value or transform matrix
        polarity % Reverses direction of select channels
        tare % Zero-load voltage tare data
        rotationMatrix % for six-axis load cells only, result of alignment tare
    end
    
    methods
        % Convert raw voltage data to force/torque 
        function out = convertVoltage(obj,rawdata)
            
        end
    end
end
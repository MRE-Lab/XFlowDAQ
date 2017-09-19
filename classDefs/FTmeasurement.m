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
        function forces = convertVoltage(obj,rawData)
            if size(obj.tare,2) ~= size(rawData,2)
                error('rawData and tare values must have the same number of columns')
            end
            forces = bsxfun(@minus,rawData,obj.tare);
            if numel(obj.calibration) == 1 % for single strain-gauge measurement
                forces = forces.*obj.calibration;
            else % for 6-axis load cells
                forces = forces*obj.calibration;
            end
            if ~isempty(rotMat)
                forces(:,1:2) = forces(:,1:2)*obj.rotationMatrix;
                forces(:,4:5) = forces(:,4:5)*obj.rotationMatrix;
            end
        end
        
    end
    
end
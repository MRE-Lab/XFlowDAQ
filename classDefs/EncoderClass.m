classdef EncoderClass < InstrumentClass
    properties
        countsPerRev % Counts per revolution of encoder
        polarity = 1; % 1 if count increases with CCW rotation, -1 for CW
        tare = 0; % Position tare value of 
    end
    
    methods
        % Convert raw encoder data to turbine blade position, radians
        function radOut = convertToRadians(obj,rawdata,bladePosOffset)
            radOut = obj.polarity.*(rawdata - obj.tare).*2*pi/obj.countsPerRev;
            radOut = mod(radOut + bladePosOffset,2*pi);
        end
    end
end
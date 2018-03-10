function [pulseSignalMin ] = pulseSignalMin(pulseSignal)

min = mean(mean(pulseSignal));
[r,c] = size(pulseSignal);
pulseSignalMin= pulseSignal;
for i =1:r
   for j = 1:c
      if(pulseSignal(i,j) < min) 
          pulseSignalMin(i,j) = 0;
      end
   end
end





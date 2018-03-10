function [ pulseSignal ] = findSignal( dataZscore,pks,pks_min)

[num,timePoint] = size(dataZscore);
pulseSignal = zeros(num,timePoint);

for i = 1:num
    
   peakMax = pks{i,1};
   peakMaxL =  pks{i,2};
   pulseValue = pks{i,4};
   
   peakMinL = pks_min{i,2};
   
   [rMax,cMax] = size(peakMax);
   
   for j = 1:cMax
       tempPulse = pulseValue(j)/(peakMaxL(j) - peakMinL(j));
       for l = peakMinL(j):peakMaxL(j)
          pulseSignal(i,l) = tempPulse; 
       end
   end
end
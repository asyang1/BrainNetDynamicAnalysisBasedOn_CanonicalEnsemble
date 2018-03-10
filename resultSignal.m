function [resultS] = resultSignal(pulseSignal)

[r,c] = size(pulseSignal);
responseFunction = zeros(1,c);
resultS = zeros(r,c);

for i = 1:c
    responseFunction(1,i) = (i) ^ 8.6 * exp((- i) / 0.547);
end

for i = 1:r
    temp = conv(pulseSignal(i,:),responseFunction);
    
    resultS(i,:) = temp(1,1:c);
end


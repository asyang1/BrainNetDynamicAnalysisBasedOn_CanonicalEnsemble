function [ resultSMin] = resultSignalMin(pulseSignalMin)

[r,c] = size(pulseSignalMin);
responseFunction = zeros(1,c);
resultSMin = zeros(r,c);

for i = 1:c
    responseFunction(1,i) = (i) ^ 8.6 * exp((- i) / 0.547);
end

for i = 1:r
    temp = conv(pulseSignalMin(i,:),responseFunction);
    
    resultSMin(i,:) = temp(1,1:c);
end
function [ resultSMinMin] = resultSignalMinMin(resultSMin)

min = mean(mean(resultSMin));
[r,c] = size(resultSMin);
resultSMinMin = resultSMin;
for i =1:r
   for j = 1:c
      if(resultSMin(i,j) < min) 
          resultSMinMin(i,j) = 0;
      end
   end
end

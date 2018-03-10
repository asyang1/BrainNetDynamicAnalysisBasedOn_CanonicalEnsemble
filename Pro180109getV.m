function [output] = Pro180109getV(input)
%得到速度矩阵即量的递增矩阵
[r,v] = size(input);
output = zeros(r,v);
for i = 1:r
   for j = 2:v
       output(i,j) = input(i,j) - input(i,j - 1);
   end
end
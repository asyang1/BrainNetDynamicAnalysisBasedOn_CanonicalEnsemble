function [output] = Pro180110removeInf(input)
% �þ����е���Сֵ������������

output = input;
[r,v] = size(output);

for i = 1:r
   for j = 1:v
      if(output(i,j) == -inf)
          output(i,j) = 0;    
      end
   end
end

tempM = min(min(output(:)));

for i = 1:r
   for j = 1:v
      if(output(i,j) == 0)
          output(i,j) = tempM;    
      end
   end
end
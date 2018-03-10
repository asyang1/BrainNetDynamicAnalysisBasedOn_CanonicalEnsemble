function [output] = Pro180107computeE(input,mass,n,n1,n2,n3,n4)
%¼ÆËã¶¯ÄÜ

[r,v] = size(input);
output = zeros(r,v);

for i = n1:n1+n
   for j = 1:v
       output(i,j) = mass(1) * input(i,j)^2 / 2;
   end
end

for i = n2:n2+n
   for j = 1:v
       output(i,j) = mass(2) * input(i,j)^2 / 2;
   end
end

for i = n3:n3+n
   for j = 1:v
       output(i,j) = mass(3) * input(i,j)^2 / 2;
   end
end

for i = n4:n4+n
   for j = 1:v
       output(i,j) = mass(4) * input(i,j)^2 / 2;
   end
end
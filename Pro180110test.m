% [r,v] = size(sumlogU);
% 
% ans = any(isinf(sumlogU(3,:))); 
% 
% for i = 1:r
%    for j = 1:v
%       if(sumlogU(i,j) == -inf)
%           sumlogU(i,j) = 0;    
%       end
%    end
% end
% 
% tempM = min(min(sumlogU(:)));
% 
% for i = 1:r
%    for j = 1:v
%       if(sumlogU(i,j) == 0)
%           sumlogU(i,j) = tempM;    
%       end
%    end
% end

% ǰ��λΪ�Ӿ�����λΪ����
[rN,vN] = size(outputNC);
[rA,vA] = size(outputAD);
oAD = zeros(rA,vA / 2);
oNC = zeros(rN,vN / 2);
flag1 = 1;
flag2 = 3; % 1��ʾǰһ��������3��ʾ��һ������
for i = 1:4
   oAD(:,flag1) = outputAD(:,flag2);
   oAD(:,flag1 + 1) = outputAD(:,flag2 + 1);
   oNC(:,flag1) = outputNC(:,flag2);
   oNC(:,flag1 + 1) = outputNC(:,flag2 + 1);
   flag1 = flag1 + 2;
   flag2 = flag2 + 4;
end
outputAD = oAD;
outputNC = oNC;
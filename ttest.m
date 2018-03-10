%对数据进行显著性分析
outputRF = zeros(4,4);
input = resultF;
for i = 1:4
   for j = 1:4
      [h,p] = ttest2(input(:,i),input(:,j));
      outputRF(i,j) = p;
   end
end


outputRS = zeros(4,4);
input = resultlogS;
for i = 1:4
   for j = 1:4
      [h,p] = ttest2(input(:,i),input(:,j));
      outputRS(i,j) = p;
   end
end

outputRU = zeros(4,4);
input = resultlogU;
for i = 1:4
   for j = 1:4
      [h,p] = ttest2(input(:,i),input(:,j));
      outputRU(i,j) = p;
   end
end

outputRZ = zeros(4,4);
input = resultlogZ;
for i = 1:4
   for j = 1:4
      [h,p] = ttest2(input(:,i),input(:,j));
      outputRZ(i,j) = p;
   end
end

% outputNF = zeros(4,4);
% input = nor_F;
% for i = 1:4
%    for j = 1:4
%       [h,p] = ttest2(input(:,i),input(:,j));
%       outputNF(i,j) = p;
%    end
% end
% 
% outputNS = zeros(4,4);
% input = nor_logS;
% for i = 1:4
%    for j = 1:4
%       [h,p] = ttest2(input(:,i),input(:,j));
%       outputNS(i,j) = p;
%    end
% end
% 
% outputNU = zeros(4,4);
% input = nor_logU;
% for i = 1:4
%    for j = 1:4
%       [h,p] = ttest2(input(:,i),input(:,j));
%       outputNU(i,j) = p;
%    end
% end
% 
% outputNZ = zeros(4,4);
% input = nor_logZ;
% for i = 1:4
%    for j = 1:4
%       [h,p] = ttest2(input(:,i),input(:,j));
%       outputNZ(i,j) = p;
%    end
% end
%fdr矫正：0.05/24 = 0.002，p比0.002小，则有显著性差异
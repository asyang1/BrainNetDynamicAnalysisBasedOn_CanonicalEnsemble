% function [r1,r2 ] = r1r2Signal(resultSMin, resultSMinMin)

dataPathMin = '.\data171205\NC\resultSMin_num';
dataPathMinMin = '.\data171205\NC\resultSMinMin_num';
num = 174;  % ÈËÊý

for i = 1:num
    name = strcat(dataPathMin,num2str(i),'.mat');
    resultSMin = importdata(name);
    name = strcat(dataPathMinMin,num2str(i),'.mat');
    resultSMinMin = importdata(name);
    
    min = mean(mean(resultSMin));
    [r,c] = size(resultSMin);
    r1 = mean(resultSMinMin(1:72,:));
    r2 = mean(resultSMinMin(649:649+71,:));
    r3 = mean(resultSMinMin(1191:1191+71,:));
    r4 = mean(resultSMinMin(1263:1263+71,:));

    for j = 1:c
      if(r1(1,j) < min)
          r1(1,j) = 0;
      end
       if(r2(1,j) < min)
          r2(1,j) = 0;
       end

      if(r3(1,j) < min)
          r3(1,j) = 0;
      end

      if(r4(1,j) < min)
          r4(1,j) = 0;
      end
    end
    
    save (['data171205\NC\r1_num',num2str(i),'.mat'],'r1');
    save (['data171205\NC\r2_num',num2str(i),'.mat'],'r2');
    save (['data171205\NC\r3_num',num2str(i),'.mat'],'r3');
    save (['data171205\NC\r4_num',num2str(i),'.mat'],'r4');
end



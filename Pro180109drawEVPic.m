clear; clc; close all;

%绘制不同脑区的均值速度对比图
%% 数据初始化
num = 174; %人数 NC(174) AD(116)
obj = 'NC_E_num'; %目标种类
n = 72 - 1;  %体素数量 85 72
% mass = [0.3729,0.3857,0.3712,0.3762];  %运动和DMN脑区灰质体积
mass = [0.5326,0.4977,0.6274,0.6162];  %视觉和听觉脑区灰质体积
n1 = 1; %第一位脑区起始位置 1(1) 43(1) 
n2 = 649; %第二位脑区起始位置 2(1029) 44(649)
n3 = 1191; %第三位脑区起始位置 23(2255) 79(1191)
n4 = 1263; %第四位脑区起始位置 24(3101) 80(1263)
% path = 'data171205/AD/resultSMinMin_num';  %输入min2数据，min2数据为广义速度
outPath = 'data180107/43_44_79_80/E/';  %输出路径

%% 读入广义动能
for i = 1:num
    load([outPath,obj,num2str(i),'.mat']);
    [r,v] = size(resultE);
    if(i == 1)
       sum1 = zeros(1,v); %保存第一位脑区均值
       sum2 = zeros(1,v); %保存第二位脑区均值
       sum3 = zeros(1,v); %保存第三位脑区均值
       sum4 = zeros(1,v); %保存第四位脑区均值
    end
    
    [resultEV] = Pro180109getV(resultE); % 得到广义动能增量矩阵
  
    %第一位脑区所有样本动能开始累加
    for j = n1:n1 + n
        sum1 = sum1 + resultEV(j,:);
    end
    
    %第二位脑区所有样本动能开始累加
    for j = n2:n2 + n
        sum2 = sum2 + resultEV(j,:);
    end
    
    %第三位脑区所有样本动能开始累加
    for j = n3:n3 + n
        sum3 = sum3 + resultEV(j,:);
    end
    
    %第四位脑区所有样本动能开始累加
    for j = n4:n4 + n
        sum4 = sum4 + resultEV(j,:);
    end   
end

% 进行均值绘图
plot((sum1 + sum2)/(2 * num),'r');
hold on;
plot((sum3 + sum4)/(2 * num),'b');
hold on;

% legend('Precentral','DMN','Location','SouthEast');
legend('Calcarine','Heschl','Location','SouthEast');
ylabel('E_v');
xlabel('Time');
hold off;
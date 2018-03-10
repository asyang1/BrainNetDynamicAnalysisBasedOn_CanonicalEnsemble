clear; clc; close all;

% 用窗函数法得到四参数的时间序列
%% 初始化输入参数
num = 116; %人数 NC(174) AD(116)
obj = 'AD'; %目标种类
n = 72 - 1;  %体素数量 85 72
T = 310;  %单位：K，对应37℃
% mass = [0.3729,0.3857,0.3712,0.3762];  %运动和DMN脑区灰质体积
mass = [0.5326,0.4977,0.6274,0.6162];  %视觉和听觉脑区灰质体积
n1 = 1; %第一位脑区起始位置 1(1) 43(1) 
n2 = 649; %第二位脑区起始位置 2(1029) 44(649)
n3 = 1191; %第三位脑区起始位置 23(2255) 79(1191)
n4 = 1263; %第四位脑区起始位置 24(3101) 80(1263)
dataPath = 'data171205/AD/resultSMinMin_num';  %输入min2数据，min2数据为广义速度
outPath = 'data180107/43_44_79_80/4para/';  %输出路径

% 窗函数相关参数
timelineLength = 130; % 时间序列长度
step = 2; % 窗步进速度
windowLength = 70; % 窗大小
windows = (timelineLength - windowLength) / 2 + 1; % 窗的数量

%% 求取每个人的四参数（自由能F、熵S、内能U、配分函数Z）时间序列
for i = 1:num
    % 结果矩阵初始化
    F = zeros(4,windows); % 自由能
    logS = zeros(4,windows); % 熵的对数
    logU = zeros(4,windows); % 内能的对数
    logZ = zeros(4,windows); % 配分函数的对数
    
    % 导入数据
    name = strcat(dataPath,num2str(i),'.mat');
    input = importdata(name);
    
    % 第一位脑区 1 43
    data1 = input(n1 : n1 + n,:);
    
    % 第二位脑区 2 44
    data2 = input(n2 : n2 + n,:);
    
    % 第三位脑区 23 79
    data3 = input(n3 : n3 + n,:);
    
    % 第一位脑区 24 80
    data4 = input(n4 : n4 + n,:);
    
    % 开始计算窗函数内的参数
    start = 1; % 初始化窗的起始位置
    for j = 1:windows
        % 对第一位脑区窗函数内的时间序列进行四参数计算
        data = data1(:,start : start + windowLength - 1);
        [tlogZ,tlogU,tF,tlogS] = computeZ(data,T,mass(1));
        logZ(1,j) = tlogZ;
        logU(1,j) = tlogU;
        logS(1,j) = tlogS;
        F(1,j) = tF;
        
        % 对第二位脑区窗函数内的时间序列进行四参数计算
        data = data2(:,start : start + windowLength - 1);
        [tlogZ,tlogU,tF,tlogS] = computeZ(data,T,mass(2));
        logZ(2,j) = tlogZ;
        logU(2,j) = tlogU;
        logS(2,j) = tlogS;
        F(2,j) = tF;
        
        % 对第三位脑区窗函数内的时间序列进行四参数计算
        data = data3(:,start : start + windowLength - 1);
        [tlogZ,tlogU,tF,tlogS] = computeZ(data,T,mass(3));
        logZ(3,j) = tlogZ;
        logU(3,j) = tlogU;
        logS(3,j) = tlogS;
        F(3,j) = tF;
        
        % 对第四位脑区窗函数内的时间序列进行四参数计算
        data = data4(:,start : start + windowLength - 1);
        [tlogZ,tlogU,tF,tlogS] = computeZ(data,T,mass(4));
        logZ(4,j) = tlogZ;
        logU(4,j) = tlogU;
        logS(4,j) = tlogS;
        F(4,j) = tF;
        
        start = start + step; % 步进完成窗函数的移动
    end
    
    % 对logU进行进行负无穷大修正
    for v = 1:4
        if(any(isinf(logU(v,:))))
            logU(v,:) = Pro180110removeInf(logU(v,:));
        end
    end
    
    % 对数据进行保存
    save ([outPath,obj,'_F_num',num2str(i),'.mat'],'F');
    save ([outPath,obj,'_logS_num',num2str(i),'.mat'],'logS');
    save ([outPath,obj,'_logU_num',num2str(i),'.mat'],'logU');
    save ([outPath,obj,'_logZ_num',num2str(i),'.mat'],'logZ');
end
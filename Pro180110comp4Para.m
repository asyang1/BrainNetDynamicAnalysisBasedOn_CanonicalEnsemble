clear; clc; close all;

%绘制四参数NC、AD比较图
%% 数据初始化
num = 174; %人数 NC(174) AD(116)
obj = 'NC'; %目标种类
inputPath = 'data180107/43_44_79_80/4para/';  %输出路径

%% 读取NC4参数时间序列并绘制均值对比图
% 开始叠加    
for i = 1:num
    % 载入数据
    load([inputPath,obj,'_F_num',num2str(i),'.mat']);
    load([inputPath,obj,'_logS_num',num2str(i),'.mat']);
    load([inputPath,obj,'_logU_num',num2str(i),'.mat']);
    load([inputPath,obj,'_logZ_num',num2str(i),'.mat']);
    
    % 初始化求和矩阵
    if(i == 1)
        [r,v] = size(F);
        sumF = zeros(1,v); %保存第一位脑区均值
        sumlogS = zeros(1,v); %保存第二位脑区均值
        sumlogU = zeros(1,v); %保存第三位脑区均值
        sumlogZ = zeros(1,v); %保存第四位脑区均值
    end

    % 累加F
    sumF = sumF + F;
    
    %累加logS
    sumlogS = sumlogS + logS;
    
    %累加logU
    sumlogU = sumlogU + logU;
    
    %累加logZ
    sumlogZ = sumlogZ + logZ;  
end

% 对logU进行负无穷大修正
for i = 1:4
    if(any(isinf(sumlogU(i,:))))
        sumlogU(i,:) = Pro180110removeInf(sumlogU(i,:));
    end
end

%% 进行均值绘图
% F对比
figure(1);
plot((sumF(1,:) + sumF(2,:))/(2 * num),'r');
hold on;
figure(2);
plot((sumF(3,:) + sumF(4,:))/(2 * num),'r');
hold on;

% logS对比
figure(3);
plot((sumlogS(1,:) + sumlogS(2,:))/(2 * num),'r');
hold on;
figure(4);
plot((sumlogS(3,:) + sumlogS(4,:))/(2 * num),'r');
hold on;

% logU对比
figure(5);
plot((sumlogU(1,:) + sumlogU(2,:))/(2 * num),'r');
hold on;
figure(6);
plot((sumlogU(3,:) + sumlogU(4,:))/(2 * num),'r');
hold on;

% logZ对比
figure(7);
plot((sumlogZ(1,:) + sumlogZ(2,:))/(2 * num),'r');
hold on;
figure(8);
plot((sumlogZ(3,:) + sumlogZ(4,:))/(2 * num),'r');
hold on;

%% 读取AD4参数时间序列并绘制均值对比图
num = 116; %人数 NC(174) AD(116)
obj = 'AD'; %目标种类
% 开始叠加    
for i = 1:num
    % 载入数据
    load([inputPath,obj,'_F_num',num2str(i),'.mat']);
    load([inputPath,obj,'_logS_num',num2str(i),'.mat']);
    load([inputPath,obj,'_logU_num',num2str(i),'.mat']);
    load([inputPath,obj,'_logZ_num',num2str(i),'.mat']);
    
    % 初始化求和矩阵
    if(i == 1)
        [r,v] = size(F);
        sumF = zeros(1,v); %保存第一位脑区均值
        sumlogS = zeros(1,v); %保存第二位脑区均值
        sumlogU = zeros(1,v); %保存第三位脑区均值
        sumlogZ = zeros(1,v); %保存第四位脑区均值
    end

    % 累加F
    sumF = sumF + F;
    
    %累加logS
    sumlogS = sumlogS + logS;
    
    %累加logU
    sumlogU = sumlogU + logU;
    
    %累加logZ
    sumlogZ = sumlogZ + logZ;  
end

% 对logU进行负无穷大修正
for i = 1:4
    if(any(isinf(sumlogU(i,:))))
        sumlogU(i,:) = Pro180110removeInf(sumlogU(i,:));
    end
end

%% 进行均值绘图
% F对比
figure(1);
plot((sumF(1,:) + sumF(2,:))/(2 * num),'b');
hold on;
legend('NC','AD','Location','SouthEast');
ylabel('F');
xlabel('Time');
% title('Precentral');
title('Calcarine');
hold off;
figure(2);
plot((sumF(3,:) + sumF(4,:))/(2 * num),'b');
hold on;
legend('NC','AD','Location','SouthEast');
ylabel('F');
xlabel('Time');
% title('DMN');
title('Heschl');
hold off;

% logS对比
figure(3);
plot((sumlogS(1,:) + sumlogS(2,:))/(2 * num),'b');
hold on;
legend('NC','AD','Location','NorthEast');
ylabel('logS');
xlabel('Time');
% title('Precentral');
title('Calcarine');
hold off;
figure(4);
plot((sumlogS(3,:) + sumlogS(4,:))/(2 * num),'b');
hold on;
legend('NC','AD','Location','NorthEast');
ylabel('logS');
xlabel('Time');
% title('DMN');
title('Heschl');
hold off;

% logU对比
figure(5);
plot((sumlogU(1,:) + sumlogU(2,:))/(2 * num),'b');
hold on;
legend('NC','AD','Location','SouthEast');
ylabel('logU');
xlabel('Time');
% title('Precentral');
title('Calcarine');
hold off;
figure(6);
plot((sumlogU(3,:) + sumlogU(4,:))/(2 * num),'b');
hold on;
legend('NC','AD','Location','SouthEast');
ylabel('logU');
xlabel('Time');
% title('DMN');
title('Heschl');
hold off;

% logZ对比
figure(7);
plot((sumlogZ(1,:) + sumlogZ(2,:))/(2 * num),'b');
hold on;
legend('NC','AD','Location','NorthEast');
ylabel('logZ');
xlabel('Time');
% title('Precentral');
title('Calcarine');
hold off;
figure(8);
plot((sumlogZ(3,:) + sumlogZ(4,:))/(2 * num),'b');
hold on;
legend('NC','AD','Location','NorthEast');
ylabel('logZ');
xlabel('Time');
% title('DMN');
title('Heschl');
hold off;
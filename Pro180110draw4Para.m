clear; clc; close all;

%绘制四参数时间序列图
%% 数据初始化
num = 116; %人数 NC(174) AD(116)
obj = 'AD'; %目标种类
inputPath = 'data180107/1_2_23_24/4para/';  %输出路径

%% 读取4参数时间序列并绘制均值对比图
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

% 进行均值绘图
% F对比
figure(1);
plot((sumF(1,:) + sumF(2,:))/(2 * num),'r');
hold on;
plot((sumF(3,:) + sumF(4,:))/(2 * num),'b');
hold on;
legend('Precentral','DMN','Location','East');
% legend('Calcarine','Heschl','Location','East');
ylabel('F');
xlabel('Time');
hold off;

% logS对比
figure(2);
plot((sumlogS(1,:) + sumlogS(2,:))/(2 * num),'r');
hold on;
plot((sumlogS(3,:) + sumlogS(4,:))/(2 * num),'b');
hold on;
legend('Precentral','DMN','Location','East');
% legend('Calcarine','Heschl','Location','East');
ylabel('logS');
xlabel('Time');
hold off;

% logU对比
figure(3);
plot((sumlogU(1,:) + sumlogU(2,:))/(2 * num),'r');
hold on;
plot((sumlogU(3,:) + sumlogU(4,:))/(2 * num),'b');
hold on;
legend('Precentral','DMN','Location','East');
% legend('Calcarine','Heschl','Location','East');
ylabel('logU');
xlabel('Time');
hold off;

% logZ对比
figure(4);
plot((sumlogZ(1,:) + sumlogZ(2,:))/(2 * num),'r');
hold on;
plot((sumlogZ(3,:) + sumlogZ(4,:))/(2 * num),'b');
hold on;
legend('Precentral','DMN','Location','East');
% legend('Calcarine','Heschl','Location','East');
ylabel('logZ');
xlabel('Time');
hold off;
clear; clc; close all;

%% 参数
num = 24; %人数
T = 300;  %单位：K，对应27℃
mass = [0.3729,0.3857,0.3712,0.3762];  %灰质体积
resultlogZ = zeros(num,4);  %结果矩阵
resultlogU = zeros(num,4);  %结果矩阵
resultlogS = zeros(num,4);  %结果矩阵
resultF = zeros(num,4);  %结果矩阵
dataPath = '.\data171110\';

%% 计算配分函数、内能、自由能、熵
for i = 1:num
    name = strcat(dataPath,'r1_num',num2str(i),'.mat');
    input = importdata(name);
    
    secNum = 1; %第几位脑区
    data = input;
    
    [logZ,logU,F,logS] = computeZ(data,T,mass(1));
    resultlogZ(i,1) = logZ;
    resultlogU(i,1) = logU;
    resultlogS(i,1) = logS;
    resultF(i,1) = F;
    
    name = strcat(dataPath,'r2_num',num2str(i),'.mat');
    input = importdata(name);
    
    secNum = 2; %第几位脑区
    data = input;
    
    [logZ,logU,F,logS] = computeZ(data,T,mass(2));
    resultlogZ(i,2) = logZ;
    resultlogU(i,2) = logU;
    resultlogS(i,2) = logS;
    resultF(i,2) = F;
    
    name = strcat(dataPath,'r3_num',num2str(i),'.mat');
    input = importdata(name);
    
    secNum = 23; %第几位脑区
    data = input;
    
    [logZ,logU,F,logS] = computeZ(data,T,mass(3));
    resultlogZ(i,3) = logZ;
    resultlogU(i,3) = logU;
    resultlogS(i,3) = logS;
    resultF(i,3) = F;
    
    name = strcat(dataPath,'r4_num',num2str(i),'.mat');
    input = importdata(name);
    
    secNum = 24; %第几位脑区
    data = input;
    
    [logZ,logU,F,logS] = computeZ(data,T,mass(4));
    resultlogZ(i,4) = logZ;
    resultlogU(i,4) = logU;
    resultlogS(i,4) = logS;
    resultF(i,4) = F;
end
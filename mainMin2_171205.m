clear; clc; close all;

%% 参数
num = 116; %人数116 174
T = 310;  %单位：K，对应37℃
mass = [0.5326,0.4977,0.6274,0.6162];  %灰质体积
resultlogZ = zeros(num,4);  %结果矩阵
resultlogU = zeros(num,4);  %结果矩阵
resultlogS = zeros(num,4);  %结果矩阵
resultF = zeros(num,4);  %结果矩阵
dataPath = '.\data171205\AD\resultSMinMin_num';

%% 计算配分函数、内能、自由能、熵
for i = 1:num
    name = strcat(dataPath,num2str(i),'.mat');
    input = importdata(name);
    
    secNum = 43; %第几位脑区
    data = input(1:72,:);
    
    [logZ,logU,F,logS] = computeZ(data,T,mass(1));
    resultlogZ(i,1) = logZ;
    resultlogU(i,1) = logU;
    resultlogS(i,1) = logS;
    resultF(i,1) = F;
    
    secNum = 44; %第几位脑区
    data = input(649:720,:);
    
    [logZ,logU,F,logS] = computeZ(data,T,mass(2));
    resultlogZ(i,2) = logZ;
    resultlogU(i,2) = logU;
    resultlogS(i,2) = logS;
    resultF(i,2) = F;
    
    secNum = 79; %第几位脑区
    data = input(1191:1262,:);
    
    [logZ,logU,F,logS] = computeZ(data,T,mass(3));
    resultlogZ(i,3) = logZ;
    resultlogU(i,3) = logU;
    resultlogS(i,3) = logS;
    resultF(i,3) = F;
    
    secNum = 80; %第几位脑区
    data = input(1263:1334,:);
    
    [logZ,logU,F,logS] = computeZ(data,T,mass(4));
    resultlogZ(i,4) = logZ;
    resultlogU(i,4) = logU;
    resultlogS(i,4) = logS;
    resultF(i,4) = F;
end
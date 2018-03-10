clear; clc; close all;

%% ����
num = 116; %����116 174
T = 310;  %��λ��K����Ӧ37��
mass = [0.5326,0.4977,0.6274,0.6162];  %�������
resultlogZ = zeros(num,4);  %�������
resultlogU = zeros(num,4);  %�������
resultlogS = zeros(num,4);  %�������
resultF = zeros(num,4);  %�������
dataPath = '.\data171205\AD\resultSMinMin_num';

%% ������ֺ��������ܡ������ܡ���
for i = 1:num
    name = strcat(dataPath,num2str(i),'.mat');
    input = importdata(name);
    
    secNum = 43; %�ڼ�λ����
    data = input(1:72,:);
    
    [logZ,logU,F,logS] = computeZ(data,T,mass(1));
    resultlogZ(i,1) = logZ;
    resultlogU(i,1) = logU;
    resultlogS(i,1) = logS;
    resultF(i,1) = F;
    
    secNum = 44; %�ڼ�λ����
    data = input(649:720,:);
    
    [logZ,logU,F,logS] = computeZ(data,T,mass(2));
    resultlogZ(i,2) = logZ;
    resultlogU(i,2) = logU;
    resultlogS(i,2) = logS;
    resultF(i,2) = F;
    
    secNum = 79; %�ڼ�λ����
    data = input(1191:1262,:);
    
    [logZ,logU,F,logS] = computeZ(data,T,mass(3));
    resultlogZ(i,3) = logZ;
    resultlogU(i,3) = logU;
    resultlogS(i,3) = logS;
    resultF(i,3) = F;
    
    secNum = 80; %�ڼ�λ����
    data = input(1263:1334,:);
    
    [logZ,logU,F,logS] = computeZ(data,T,mass(4));
    resultlogZ(i,4) = logZ;
    resultlogU(i,4) = logU;
    resultlogS(i,4) = logS;
    resultF(i,4) = F;
end
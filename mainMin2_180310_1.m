clear; clc; close all;

%% ����
num = 17; %����
T = 310;  %��λ��K����Ӧ37��
mass = [0.3729,0.3857,0.3712,0.3762];  %�������
resultlogZ = zeros(num,4);  %�������
resultlogU = zeros(num,4);  %�������
resultlogS = zeros(num,4);  %�������
resultF = zeros(num,4);  %�������
dataPath = '.\data180310\NC\resultSMinMin_num';

%% ������ֺ��������ܡ������ܡ���
for i = 1:num
    name = strcat(dataPath,num2str(i),'.mat');
    input = importdata(name);
    
    secNum = 1; %�ڼ�λ����
    data = input(1:85,:);
    
    [logZ,logU,F,logS] = computeZ(data,T,mass(1));
    resultlogZ(i,1) = logZ;
    resultlogU(i,1) = logU;
    resultlogS(i,1) = logS;
    resultF(i,1) = F;
    
    secNum = 2; %�ڼ�λ����
    data = input(1029:1113,:);
    
    [logZ,logU,F,logS] = computeZ(data,T,mass(2));
    resultlogZ(i,2) = logZ;
    resultlogU(i,2) = logU;
    resultlogS(i,2) = logS;
    resultF(i,2) = F;
    
    secNum = 23; %�ڼ�λ����
    data = input(2031:2115,:);
    
    [logZ,logU,F,logS] = computeZ(data,T,mass(3));
    resultlogZ(i,3) = logZ;
    resultlogU(i,3) = logU;
    resultlogS(i,3) = logS;
    resultF(i,3) = F;
    
    secNum = 24; %�ڼ�λ����
    data = input(2877:2961,:);
    
    [logZ,logU,F,logS] = computeZ(data,T,mass(4));
    resultlogZ(i,4) = logZ;
    resultlogU(i,4) = logU;
    resultlogS(i,4) = logS;
    resultF(i,4) = F;
end
clear; clc; close all;

% �ô��������õ��Ĳ�����ʱ������
%% ��ʼ���������
num = 116; %���� NC(174) AD(116)
obj = 'AD'; %Ŀ������
n = 72 - 1;  %�������� 85 72
T = 310;  %��λ��K����Ӧ37��
% mass = [0.3729,0.3857,0.3712,0.3762];  %�˶���DMN�����������
mass = [0.5326,0.4977,0.6274,0.6162];  %�Ӿ������������������
n1 = 1; %��һλ������ʼλ�� 1(1) 43(1) 
n2 = 649; %�ڶ�λ������ʼλ�� 2(1029) 44(649)
n3 = 1191; %����λ������ʼλ�� 23(2255) 79(1191)
n4 = 1263; %����λ������ʼλ�� 24(3101) 80(1263)
dataPath = 'data171205/AD/resultSMinMin_num';  %����min2���ݣ�min2����Ϊ�����ٶ�
outPath = 'data180107/43_44_79_80/4para/';  %���·��

% ��������ز���
timelineLength = 130; % ʱ�����г���
step = 2; % �������ٶ�
windowLength = 70; % ����С
windows = (timelineLength - windowLength) / 2 + 1; % ��������

%% ��ȡÿ���˵��Ĳ�����������F����S������U����ֺ���Z��ʱ������
for i = 1:num
    % ��������ʼ��
    F = zeros(4,windows); % ������
    logS = zeros(4,windows); % �صĶ���
    logU = zeros(4,windows); % ���ܵĶ���
    logZ = zeros(4,windows); % ��ֺ����Ķ���
    
    % ��������
    name = strcat(dataPath,num2str(i),'.mat');
    input = importdata(name);
    
    % ��һλ���� 1 43
    data1 = input(n1 : n1 + n,:);
    
    % �ڶ�λ���� 2 44
    data2 = input(n2 : n2 + n,:);
    
    % ����λ���� 23 79
    data3 = input(n3 : n3 + n,:);
    
    % ��һλ���� 24 80
    data4 = input(n4 : n4 + n,:);
    
    % ��ʼ���㴰�����ڵĲ���
    start = 1; % ��ʼ��������ʼλ��
    for j = 1:windows
        % �Ե�һλ�����������ڵ�ʱ�����н����Ĳ�������
        data = data1(:,start : start + windowLength - 1);
        [tlogZ,tlogU,tF,tlogS] = computeZ(data,T,mass(1));
        logZ(1,j) = tlogZ;
        logU(1,j) = tlogU;
        logS(1,j) = tlogS;
        F(1,j) = tF;
        
        % �Եڶ�λ�����������ڵ�ʱ�����н����Ĳ�������
        data = data2(:,start : start + windowLength - 1);
        [tlogZ,tlogU,tF,tlogS] = computeZ(data,T,mass(2));
        logZ(2,j) = tlogZ;
        logU(2,j) = tlogU;
        logS(2,j) = tlogS;
        F(2,j) = tF;
        
        % �Ե���λ�����������ڵ�ʱ�����н����Ĳ�������
        data = data3(:,start : start + windowLength - 1);
        [tlogZ,tlogU,tF,tlogS] = computeZ(data,T,mass(3));
        logZ(3,j) = tlogZ;
        logU(3,j) = tlogU;
        logS(3,j) = tlogS;
        F(3,j) = tF;
        
        % �Ե���λ�����������ڵ�ʱ�����н����Ĳ�������
        data = data4(:,start : start + windowLength - 1);
        [tlogZ,tlogU,tF,tlogS] = computeZ(data,T,mass(4));
        logZ(4,j) = tlogZ;
        logU(4,j) = tlogU;
        logS(4,j) = tlogS;
        F(4,j) = tF;
        
        start = start + step; % ������ɴ��������ƶ�
    end
    
    % ��logU���н��и����������
    for v = 1:4
        if(any(isinf(logU(v,:))))
            logU(v,:) = Pro180110removeInf(logU(v,:));
        end
    end
    
    % �����ݽ��б���
    save ([outPath,obj,'_F_num',num2str(i),'.mat'],'F');
    save ([outPath,obj,'_logS_num',num2str(i),'.mat'],'logS');
    save ([outPath,obj,'_logU_num',num2str(i),'.mat'],'logU');
    save ([outPath,obj,'_logZ_num',num2str(i),'.mat'],'logZ');
end
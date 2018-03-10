clear; clc; close all;

%����NC��AD�ľ�ֵ�Ա�ͼ
%% ��ʼ��NC����
num = 174; %���� NC(174) AD(116)
obj = 'NC_E_num'; %Ŀ������
n = 72 - 1;  %�������� 85 72
% mass = [0.3729,0.3857,0.3712,0.3762];  %�˶���DMN�����������
mass = [0.5326,0.4977,0.6274,0.6162];  %�Ӿ������������������
n1 = 1; %��һλ������ʼλ�� 1(1) 43(1) 
n2 = 649; %�ڶ�λ������ʼλ�� 2(1029) 44(649)
n3 = 1191; %����λ������ʼλ�� 23(2255) 79(1191)
n4 = 1263; %����λ������ʼλ�� 24(3101) 80(1263)
outPath = 'data180107/43_44_79_80/E/';  %���·��

%% ����NC��ֵͼ
for i = 1:num
    load([outPath,obj,num2str(i),'.mat']);
    [r,v] = size(resultE);
    if(i == 1)
       sum1 = zeros(1,v); %�����һλ������ֵ
       sum2 = zeros(1,v); %����ڶ�λ������ֵ
       sum3 = zeros(1,v); %�������λ������ֵ
       sum4 = zeros(1,v); %�������λ������ֵ
    end
    
    %��һλ���������������ܿ�ʼ�ۼ�
    for j = n1:n1 + n
        sum1 = sum1 + resultE(j,:);
    end
    
    %�ڶ�λ���������������ܿ�ʼ�ۼ�
    for j = n2:n2 + n
        sum2 = sum2 + resultE(j,:);
    end
    
    %����λ���������������ܿ�ʼ�ۼ�
    for j = n3:n3 + n
        sum3 = sum3 + resultE(j,:);
    end
    
    %����λ���������������ܿ�ʼ�ۼ�
    for j = n4:n4 + n
        sum4 = sum4 + resultE(j,:);
    end   
end

%���о�ֵ��ͼ
figure(1); %��һ��ͼ
plot((sum1 + sum2)/(2 * num),'r');
hold on;
figure(2); %�ڶ���ͼ
plot((sum3 + sum4)/(2 * num),'r');
hold on;

%% ����AD��ֵͼ
num = 116; %���� NC(174) AD(116)
obj = 'AD_E_num'; %Ŀ������
for i = 1:num
    load([outPath,obj,num2str(i),'.mat']);
    [r,v] = size(resultE);
    if(i == 1)
       sum1 = zeros(1,v); %�����һλ������ֵ
       sum2 = zeros(1,v); %����ڶ�λ������ֵ
       sum3 = zeros(1,v); %�������λ������ֵ
       sum4 = zeros(1,v); %�������λ������ֵ
    end
    
    %��һλ���������������ܿ�ʼ�ۼ�
    for j = n1:n1 + n
        sum1 = sum1 + resultE(j,:);
    end
    
    %�ڶ�λ���������������ܿ�ʼ�ۼ�
    for j = n2:n2 + n
        sum2 = sum2 + resultE(j,:);
    end
    
    %����λ���������������ܿ�ʼ�ۼ�
    for j = n3:n3 + n
        sum3 = sum3 + resultE(j,:);
    end
    
    %����λ���������������ܿ�ʼ�ۼ�
    for j = n4:n4 + n
        sum4 = sum4 + resultE(j,:);
    end   
end

% ���о�ֵ��ͼ
figure(1); % ��һ��ͼ
plot((sum1 + sum2)/(2 * num),'b');
legend('NC','AD','Location','SouthEast');
ylabel('E');
xlabel('Time');
% title('Precentral')
title('Calcarine')
hold off;

figure(2); % �ڶ���ͼ
plot((sum3 + sum4)/(2 * num),'b');
legend('NC','AD','Location','SouthEast');
ylabel('E');
xlabel('Time');
% title('DMN');
title('Heschl')
hold off;
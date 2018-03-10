clear; clc; close all;

%�����Ĳ���NC��AD�Ƚ�ͼ
%% ���ݳ�ʼ��
num = 174; %���� NC(174) AD(116)
obj = 'NC'; %Ŀ������
inputPath = 'data180107/43_44_79_80/4para/';  %���·��

%% ��ȡNC4����ʱ�����в����ƾ�ֵ�Ա�ͼ
% ��ʼ����    
for i = 1:num
    % ��������
    load([inputPath,obj,'_F_num',num2str(i),'.mat']);
    load([inputPath,obj,'_logS_num',num2str(i),'.mat']);
    load([inputPath,obj,'_logU_num',num2str(i),'.mat']);
    load([inputPath,obj,'_logZ_num',num2str(i),'.mat']);
    
    % ��ʼ����;���
    if(i == 1)
        [r,v] = size(F);
        sumF = zeros(1,v); %�����һλ������ֵ
        sumlogS = zeros(1,v); %����ڶ�λ������ֵ
        sumlogU = zeros(1,v); %�������λ������ֵ
        sumlogZ = zeros(1,v); %�������λ������ֵ
    end

    % �ۼ�F
    sumF = sumF + F;
    
    %�ۼ�logS
    sumlogS = sumlogS + logS;
    
    %�ۼ�logU
    sumlogU = sumlogU + logU;
    
    %�ۼ�logZ
    sumlogZ = sumlogZ + logZ;  
end

% ��logU���и����������
for i = 1:4
    if(any(isinf(sumlogU(i,:))))
        sumlogU(i,:) = Pro180110removeInf(sumlogU(i,:));
    end
end

%% ���о�ֵ��ͼ
% F�Ա�
figure(1);
plot((sumF(1,:) + sumF(2,:))/(2 * num),'r');
hold on;
figure(2);
plot((sumF(3,:) + sumF(4,:))/(2 * num),'r');
hold on;

% logS�Ա�
figure(3);
plot((sumlogS(1,:) + sumlogS(2,:))/(2 * num),'r');
hold on;
figure(4);
plot((sumlogS(3,:) + sumlogS(4,:))/(2 * num),'r');
hold on;

% logU�Ա�
figure(5);
plot((sumlogU(1,:) + sumlogU(2,:))/(2 * num),'r');
hold on;
figure(6);
plot((sumlogU(3,:) + sumlogU(4,:))/(2 * num),'r');
hold on;

% logZ�Ա�
figure(7);
plot((sumlogZ(1,:) + sumlogZ(2,:))/(2 * num),'r');
hold on;
figure(8);
plot((sumlogZ(3,:) + sumlogZ(4,:))/(2 * num),'r');
hold on;

%% ��ȡAD4����ʱ�����в����ƾ�ֵ�Ա�ͼ
num = 116; %���� NC(174) AD(116)
obj = 'AD'; %Ŀ������
% ��ʼ����    
for i = 1:num
    % ��������
    load([inputPath,obj,'_F_num',num2str(i),'.mat']);
    load([inputPath,obj,'_logS_num',num2str(i),'.mat']);
    load([inputPath,obj,'_logU_num',num2str(i),'.mat']);
    load([inputPath,obj,'_logZ_num',num2str(i),'.mat']);
    
    % ��ʼ����;���
    if(i == 1)
        [r,v] = size(F);
        sumF = zeros(1,v); %�����һλ������ֵ
        sumlogS = zeros(1,v); %����ڶ�λ������ֵ
        sumlogU = zeros(1,v); %�������λ������ֵ
        sumlogZ = zeros(1,v); %�������λ������ֵ
    end

    % �ۼ�F
    sumF = sumF + F;
    
    %�ۼ�logS
    sumlogS = sumlogS + logS;
    
    %�ۼ�logU
    sumlogU = sumlogU + logU;
    
    %�ۼ�logZ
    sumlogZ = sumlogZ + logZ;  
end

% ��logU���и����������
for i = 1:4
    if(any(isinf(sumlogU(i,:))))
        sumlogU(i,:) = Pro180110removeInf(sumlogU(i,:));
    end
end

%% ���о�ֵ��ͼ
% F�Ա�
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

% logS�Ա�
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

% logU�Ա�
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

% logZ�Ա�
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
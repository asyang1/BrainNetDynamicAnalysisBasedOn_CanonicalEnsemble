clear; clc; close all;

%�����Ĳ���ʱ������ͼ
%% ���ݳ�ʼ��
num = 116; %���� NC(174) AD(116)
obj = 'AD'; %Ŀ������
inputPath = 'data180107/1_2_23_24/4para/';  %���·��

%% ��ȡ4����ʱ�����в����ƾ�ֵ�Ա�ͼ
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

% ���о�ֵ��ͼ
% F�Ա�
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

% logS�Ա�
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

% logU�Ա�
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

% logZ�Ա�
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
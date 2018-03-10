clear; clc; close all;

%% ��������
numP = 24;  %������
data = importdata('./data171005/Data_timepoint_171005.mat');
dataPath = './data171005/';


%% ��ȡ����
for num = 1:numP
    name = strcat('OriginalNum',num2str(num));
    input = data{num,1}.TimePoint;
    
    %��ȡ1����������
    Name1 = strcat(name,'_1');
    temp = zeros(85,130);
    for i = 1:85
        temp(i,:) = input(i,:);
    end
    eval([Name1, '=', 'temp', ';']); 
    save([dataPath, Name1], Name1);

    %��ȡ2����������
    Name1 = strcat(name,'_2');
    temp = zeros(85,130);
    for i = 1:85
        temp(i,:) = input(85+i,:);
    end
    eval([Name1, '=', 'temp', ';']); 
    save([dataPath, Name1], Name1);

    %��ȡ23����������
    Name1 = strcat(name,'_23');
    temp = zeros(85,130);
    for i = 1:85
        temp(i,:) = input(340+i,:);
    end
    eval([Name1, '=', 'temp', ';']); 
    save([dataPath, Name1], Name1);

    %��ȡ24����������
    Name1 = strcat(name,'_24');
    temp = zeros(85,130);
    for i = 1:85
        temp(i,:) = input(426+i,:);
    end
    eval([Name1, '=', 'temp', ';']); 
    save([dataPath, Name1], Name1);
end
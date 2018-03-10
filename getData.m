clear; clc; close all;

%% 参数设置
numP = 24;  %总人数
data = importdata('./data171005/Data_timepoint_171005.mat');
dataPath = './data171005/';


%% 提取数据
for num = 1:numP
    name = strcat('OriginalNum',num2str(num));
    input = data{num,1}.TimePoint;
    
    %提取1号脑区数据
    Name1 = strcat(name,'_1');
    temp = zeros(85,130);
    for i = 1:85
        temp(i,:) = input(i,:);
    end
    eval([Name1, '=', 'temp', ';']); 
    save([dataPath, Name1], Name1);

    %提取2号脑区数据
    Name1 = strcat(name,'_2');
    temp = zeros(85,130);
    for i = 1:85
        temp(i,:) = input(85+i,:);
    end
    eval([Name1, '=', 'temp', ';']); 
    save([dataPath, Name1], Name1);

    %提取23号脑区数据
    Name1 = strcat(name,'_23');
    temp = zeros(85,130);
    for i = 1:85
        temp(i,:) = input(340+i,:);
    end
    eval([Name1, '=', 'temp', ';']); 
    save([dataPath, Name1], Name1);

    %提取24号脑区数据
    Name1 = strcat(name,'_24');
    temp = zeros(85,130);
    for i = 1:85
        temp(i,:) = input(426+i,:);
    end
    eval([Name1, '=', 'temp', ';']); 
    save([dataPath, Name1], Name1);
end
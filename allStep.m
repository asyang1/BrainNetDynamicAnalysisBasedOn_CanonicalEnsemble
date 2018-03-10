clear; clc; close all;

load('data171205\NC\Data_NC.mat');
OrignalData = data;
[num,obj] = size(data);


for i = 1:num
    %提取数据
    data = OrignalData{i,1}.TimePoint;

    %标准化
    dataZscore = zscore(data);

    %获取极大值点
    pks = myPeaks(dataZscore);

    %获取极小值点
    pks_min = myPeaksmin(dataZscore,pks);

    %获取广义脉冲信号
    pulseSignal = findSignal( dataZscore,pks,pks_min);

    %计算初始脉冲响应
    resultS = resultSignal(pulseSignal);

    %对广义脉冲信号进行均值下置0处理
    pulseSMin = pulseSignalMin(pulseSignal);

    %求处理后的脉冲响应
    resultSMin = resultSignalMin(pulseSMin);

    %对处理后的脉冲响应进行均值下置0处理
    resultSMinMin = resultSignalMinMin(resultSMin);

    %对前85个体素进行平均，并以resultSMin的标准进行均值下置0处理
    % [r1,r2 ] = r1r2Signal(resultSMin, resultSMinMin);

    %进行数据保存
    save (['data171205\NC\data_num',num2str(i),'.mat'],'data');
    save (['data171205\NC\dataZscore_num',num2str(i),'.mat'],'dataZscore');
    save (['data171205\NC\pks_num',num2str(i),'.mat'],'pks');
    save (['data171205\NC\pks_num',num2str(i),'_min','.mat'],'pks_min');
    save (['data171205\NC\pulseSignal_num',num2str(i),'.mat'],'pulseSignal');
    save (['data171205\NC\pulseSignalMin_num',num2str(i),'.mat'],'pulseSMin');
    save (['data171205\NC\resultS_num',num2str(i),'.mat'],'resultS');
    save (['data171205\NC\resultSMin_num',num2str(i),'.mat'],'resultSMin');
    save (['data171205\NC\resultSMinMin_num',num2str(i),'.mat'],'resultSMinMin');
end
clear; clc; close all;

load('data171205\NC\Data_NC.mat');
OrignalData = data;
[num,obj] = size(data);


for i = 1:num
    %��ȡ����
    data = OrignalData{i,1}.TimePoint;

    %��׼��
    dataZscore = zscore(data);

    %��ȡ����ֵ��
    pks = myPeaks(dataZscore);

    %��ȡ��Сֵ��
    pks_min = myPeaksmin(dataZscore,pks);

    %��ȡ���������ź�
    pulseSignal = findSignal( dataZscore,pks,pks_min);

    %�����ʼ������Ӧ
    resultS = resultSignal(pulseSignal);

    %�Թ��������źŽ��о�ֵ����0����
    pulseSMin = pulseSignalMin(pulseSignal);

    %������������Ӧ
    resultSMin = resultSignalMin(pulseSMin);

    %�Դ�����������Ӧ���о�ֵ����0����
    resultSMinMin = resultSignalMinMin(resultSMin);

    %��ǰ85�����ؽ���ƽ��������resultSMin�ı�׼���о�ֵ����0����
    % [r1,r2 ] = r1r2Signal(resultSMin, resultSMinMin);

    %�������ݱ���
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
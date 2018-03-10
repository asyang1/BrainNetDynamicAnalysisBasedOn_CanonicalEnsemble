function [ logZ ,logU,F,logS ] = computeZ( data,T,mass)
%UNTITLED6 Summary of this function goes here
%   ���룺
%       data����������
%       T:���Ի����¶�
%       mass���������صĻ������
%   �����
%       Z����ֺ���

%% Ԥ����

%�����������С�����У�timeΪʱ�����г��ȡ�numΪ���ظ���
[num,time] = size(data);

%�������е�Ԫ������Ϊ����
% dataMin = min(min(data));
% dataMax = max(max(data));
% modPara = dataMax - dataMin;
% modData = data + ones(num,time) * modPara;
modData = data;

%% �����ܼ�

% %��mod_data�����ֵ����Сֵ��������Сֵ����ȡ�������ֵ����ȡ����ȡ�������100
% dataCeil = ceil(max(max(data))) * 100;
% dataFloor = floor(min(min(data))) * 100;
% 
% %����level�ж��ܼ���������level����
% levelNum = (dataCeil - dataFloor)/level;
% levelMatrix = zeros(3,levelNum - 1);
% 
% for i = 1:levelNum
%     floor = dataFloor + level * (i - 1);
%     ceil = dataFloor + level * i;
%     
% end

%% ���㶯����ֺ���
%�����ֵ
k = 1.3806505 * 10^-23 ; %KB��������������
beta = 1 / T;

%������������
EsMatrix = zeros(num,time);
for i = 1:num
    for j = 1:time
        EsMatrix(i,j) = mass * modData(i,j)^2 / 2;
    end
end

%������������й�һ������

%����ÿ�����ص���ֺ���
h = 1;
logPerZ = zeros(num,1);
for i = 1:num
    tempsum = 0;
    for j = 1:time
        para = -1 * beta * EsMatrix(i,j);
        temp = exp(para);
        tempsum = tempsum + temp;
    end
    logPerZ(i,1) = log10(tempsum); 
end

%���������Ķ�����ֺ���
N = factorial(num);
logEsZ = sum(logPerZ) - log10(N * h^num); 

%% ����������ֺ���

%����Spearman���ϵ�� 
 SpearMatrix = zeros(num,num);
 for i = 1:num
    for j = i:num
        SpearMatrix(i,j) = abs(corr(modData(i,:)',modData(j,:)', 'type' , 'Spearman')); 
        if( isnan(SpearMatrix(i,j)))
            temp = 0;
            for t = 1:time
                temp = temp + (modData(i,t) - modData(j,t))^2;
            end
            SpearMatrix(i,j) = abs(1 - 6*temp/(time*(time^2 - 1)));
        end 
    end
 end
 
 %�������ϵ����ȡ����������
 Q = 0;
 for i = 1:num
    for j = i+1:num
        Q = Q + SpearMatrix(i,j) * abs(i-j);
    end
 end
 
Q = exp(-beta*Q);
 
 %����������ֺ���
%  Z = 10^logEsZ * Q;
%  logZ = logEsZ + log10(Q);
 Z = 10^logEsZ;
 logZ = logEsZ;
 
 %% ��������
 perU = zeros(num,1);
 logperU = zeros(num,1);
 for i = 1:num
    tempsum = 0;
    for j = 1:time
        para = -1 * beta * EsMatrix(i,j);
        temp = EsMatrix(i,j) * exp(para);
        tempsum = tempsum + temp;
    end
    
    perU(i,1) = tempsum/(10^logPerZ(i,1));
    logperU(i,1) = log10(tempsum/(10^logPerZ(i,1)));
 end
 
 logU = log10(sum(perU(:)));
%     logU = sum(perU(:));
  
 %% ����������
 
 F = -1 * num * T * logZ/log10(exp(1));
 
 %% ������
 
%  logS = log10(num * logZ/log10(exp(1)) + 10^logU/T) ;
 logS = num * logZ/log10(exp(1)) + 10^logU/T;
 if logS == inf
     logS = logU - log10(T);
 end
 k =1;
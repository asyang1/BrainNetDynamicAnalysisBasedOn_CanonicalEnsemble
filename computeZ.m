function [ logZ ,logU,F,logS ] = computeZ( data,T,mass)
%UNTITLED6 Summary of this function goes here
%   输入：
%       data：脑区数据
%       T:大脑环境温度
%       mass：单个体素的灰质体积
%   输出：
%       Z：配分函数

%% 预处理

%求得输入矩阵大小，其中：time为时间序列长度、num为体素个数
[num,time] = size(data);

%将矩阵中的元素修正为正数
% dataMin = min(min(data));
% dataMax = max(max(data));
% modPara = dataMax - dataMin;
% modData = data + ones(num,time) * modPara;
modData = data;

%% 划分能级

% %求mod_data的最大值、最小值，并将最小值向下取整，最大值向上取整，取整后乘以100
% dataCeil = ceil(max(max(data))) * 100;
% dataFloor = floor(min(min(data))) * 100;
% 
% %根据level判断能级数，生成level矩阵
% levelNum = (dataCeil - dataFloor)/level;
% levelMatrix = zeros(3,levelNum - 1);
% 
% for i = 1:levelNum
%     floor = dataFloor + level * (i - 1);
%     ceil = dataFloor + level * i;
%     
% end

%% 计算动能配分函数
%计算β值
k = 1.3806505 * 10^-23 ; %KB，玻尔兹曼常量
beta = 1 / T;

%计算能量矩阵
EsMatrix = zeros(num,time);
for i = 1:num
    for j = 1:time
        EsMatrix(i,j) = mass * modData(i,j)^2 / 2;
    end
end

%对能量矩阵进行归一化处理

%计算每个体素的配分函数
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

%计算脑区的动能配分函数
N = factorial(num);
logEsZ = sum(logPerZ) - log10(N * h^num); 

%% 计算势能配分函数

%计算Spearman相关系数 
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
 
 %根据相关系数求取脑区总势能
 Q = 0;
 for i = 1:num
    for j = i+1:num
        Q = Q + SpearMatrix(i,j) * abs(i-j);
    end
 end
 
Q = exp(-beta*Q);
 
 %计算最终配分函数
%  Z = 10^logEsZ * Q;
%  logZ = logEsZ + log10(Q);
 Z = 10^logEsZ;
 logZ = logEsZ;
 
 %% 计算内能
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
  
 %% 计算自由能
 
 F = -1 * num * T * logZ/log10(exp(1));
 
 %% 计算熵
 
%  logS = log10(num * logZ/log10(exp(1)) + 10^logU/T) ;
 logS = num * logZ/log10(exp(1)) + 10^logU/T;
 if logS == inf
     logS = logU - log10(T);
 end
 k =1;
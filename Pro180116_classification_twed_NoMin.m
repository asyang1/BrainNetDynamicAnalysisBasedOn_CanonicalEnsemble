clear; clc; close all;
load('data171212/1_2_23_24/outputNC3.mat');
load('data171212/1_2_23_24/outputAD3.mat');
% load('data171212/43_44_79_80/outputNC3.mat');
% load('data171212/43_44_79_80/outputAD3.mat');

%% 大循环，每次折数不同
fNum = 10;
final_accu = zeros(1,fNum - 1);
for fnum = 2:fNum
    %% 设置训练参数
    num = 200; % 训练次数
    fold = fnum; % 设置折数

    %% 整理训练数据
    [rAD,vAD] = size(outputAD);
    [rNC,vNC] = size(outputNC);
    feature = [outputAD;outputNC];
    true_label = [ones(rAD,1);zeros(rNC,1)];

    %% 开始训练
    % 分配空间，TP = true positive，TN = true negative，FP = false positive，
    % FN = false negative
    Predict_labels = zeros(rAD + rNC,num);
    Accuracys = zeros(num,1);
    Sensitivitys = zeros(num,1);
    Specificitys = zeros(num,1);
    TP = zeros(num,1);
    FP = zeros(num,1);
    TN = zeros(num,1);
    FN = zeros(num,1);
    F1 = zeros(num,1);

    % 用线性SVM实现num次随机10折交叉验证过程
    for i = 1:num
        fprintf('#%d ',i);
        mdl = fitcsvm(feature,true_label,'Standardize',true,'KernelScale','auto'); % 进行线性SVM分类 
        cvmodel = crossval(mdl,'Kfold',fold);
        predict_label = kfoldPredict(cvmodel);
        Predict_labels(:,i) = predict_label;
        accuracy = length(find(predict_label == true_label))/length(true_label)*100;
        Accuracys(i) = accuracy;
        fprintf('OK\n');
    end

    % 用Logistic回归实现num次随机fold折交叉验证过程
%     cMatrix = [feature,true_label];
%     [cc,cv] = size(cMatrix);
%     for i = 1:num
%         fprintf('#%d ',i);
%         Indices = crossvalind('KFold',rNC + rAD,fold); %生成几折校验指针
%         sumA = 0;
%         for j = 1:fold
%             %初始化本轮几折校验数据
%             testN = 1;
%             trainN = 1;
%             test = [];
%             train = [];
%             for turn = 1:rAD + rNC
%                 if(Indices(turn) == j)
%                     test(testN,:) = cMatrix(turn,:);
%                     testN = testN + 1;
%                 else
%                     train(trainN,:) = cMatrix(turn,:);
%                     trainN = trainN + 1;
%                 end
%             end
%             %进行逻辑回归训练
%             model = glmfit(train(:,1:cv-1),train(:,cv),'binomial', 'link', 'logit'); % 进行Logistic Regression分类 
%             predict_label = glmval(model,test(:,1:cv-1), 'logit');
%             for curF = 1:testN - 1
%                 if predict_label(curF,1) < 0.5
%                     predict_label(curF,1) = 0;              
%                 else
%                     predict_label(curF,1) = 1;   
%                 end
%             end
%             current_label = test(:,cv);
%             A =  length(find(predict_label == current_label))/length(current_label)*100;
%             sumA = sumA + A;
%         end
%         accuracy = sumA/fold;
%         Accuracys(i) = accuracy;
%         fprintf('OK\n');
%     end

    % 根据num次预测标签计算各种分类结果指标
    for i = 1:num
        TP(i) = sum(Predict_labels(1:rAD,i));
        FP(i) = sum(Predict_labels(rAD+1:rAD+rNC,i));
        TN(i) = rNC-FP(i);
        FN(i) = rAD-TP(i);
        Sensitivitys(i) = TP(i)/rAD;
        Specificitys(i) = TN(i)/rNC;
        F1(i) = 2*TP(i)/(2*TP(i)+FP(i)+FN(i));
    end

    % 计算这些指标的num次的均值和标准差
    std_accuracy = std(Accuracys);
    std_sensitivity = std(Sensitivitys);
    std_specificity = std(Specificitys);
    std_F1 = std(F1);
    std_TP = std(TP);
    std_FP = std(FP);
    std_TN = std(TN);
    std_FN = std(FN);

    mean_accuracy = mean(Accuracys);
    final_accu(1,fnum - 1) = mean_accuracy;
    mean_sensitivity = mean(Sensitivitys);
    mean_specificity = mean(Specificitys);
    mean_F1 = mean(F1);
    mean_TP = mean(TP);
    mean_FP = mean(FP);
    mean_TN = mean(TN);
    mean_FN = mean(FN);
end
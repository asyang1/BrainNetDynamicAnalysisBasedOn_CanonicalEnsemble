clear; clc; close all;
%对处理好的AD和NC数据进行比较

way = '2';
min = ['min',way];
state = 'result';
pathAll = {'data171126/','data171205/com/'};
[r,pathN] = size(pathAll);
outPath = 'data180320/';

i = 1;
for pathNum = 1:pathN
    path = pathAll{pathNum};
    %载入数据并归一化到0~100，归一化完毕后组成特征矩阵
    dataNC = load([path,state,'F',min,'NC.mat']);
    dataNC = struct2cell(dataNC);
    dataNC = dataNC{1,1};
    [numNC,lengthNC] = size(dataNC);

    dataAD = load([path,state,'F',min,'AD.mat']);
    dataAD = struct2cell(dataAD);
    dataAD = dataAD{1,1};
    [numAD,lengthAD] = size(dataAD);
    
    if pathNum == 1
        outputNC = zeros(numNC,16*pathN);
        outputAD = zeros(numAD,16*pathN);
    end

    tempNC = reshape(dataNC,[1,numNC*lengthNC]);
    tempNC = reshape(mapminmax(tempNC,0,1),[numNC,lengthNC]);
%     save ([outPath,state,'FNor','NC',min,'.mat'],'tempNC');

    tempAD = reshape(dataAD,[1,numAD*lengthAD]);
    tempAD = reshape(mapminmax(tempAD,0,1),[numAD,lengthAD]);
%     save ([outPath,state,'FNor','AD',min,'.mat'],'tempAD');


    for n = 1:numNC
       outputNC(n,i:i+3) = tempNC(n,1:4); 
    end

    for n = 1:numAD
       outputAD(n,i:i+3) = tempAD(n,1:4); 
    end

    i = i + 4;

    dataNC = load([path,state,'logS',min,'NC.mat']);
    dataNC = struct2cell(dataNC);
    dataNC = dataNC{1,1};
    [numNC,lengthNC] = size(dataNC);

    dataAD = load([path,state,'logS',min,'AD.mat']);
    dataAD = struct2cell(dataAD);
    dataAD = dataAD{1,1};
    [numAD,lengthAD] = size(dataAD);

    tempNC = reshape(dataNC,[1,numNC*lengthNC]);
    tempNC = reshape(mapminmax(tempNC,0,1),[numNC,lengthNC]);

    tempAD = reshape(dataAD,[1,numAD*lengthAD]);
    tempAD = reshape(mapminmax(tempAD,0,1),[numAD,lengthAD]);


    for n = 1:numNC
       outputNC(n,i:i+3) = tempNC(n,1:4); 
    end

    for n = 1:numAD
       outputAD(n,i:i+3) = tempAD(n,1:4); 
    end

    i = i + 4;

    dataNC = load([path,state,'logU',min,'NC.mat']);
    dataNC = struct2cell(dataNC);
    dataNC = dataNC{1,1};
    [numNC,lengthNC] = size(dataNC);

    dataAD = load([path,state,'logU',min,'AD.mat']);
    dataAD = struct2cell(dataAD);
    dataAD = dataAD{1,1};
    [numAD,lengthAD] = size(dataAD);

    tempNC = reshape(dataNC,[1,numNC*lengthNC]);
    tempNC = reshape(mapminmax(tempNC,0,1),[numNC,lengthNC]);

    tempAD = reshape(dataAD,[1,numAD*lengthAD]);
    tempAD = reshape(mapminmax(tempAD,0,1),[numAD,lengthAD]);


    for n = 1:numNC
       outputNC(n,i:i+3) = tempNC(n,1:4); 
    end

    for n = 1:numAD
       outputAD(n,i:i+3) = tempAD(n,1:4); 
    end

    i = i + 4;

    dataNC = load([path,state,'logZ',min,'NC.mat']);
    dataNC = struct2cell(dataNC);
    dataNC = dataNC{1,1};
    [numNC,lengthNC] = size(dataNC);

    dataAD = load([path,state,'logZ',min,'AD.mat']);
    dataAD = struct2cell(dataAD);
    dataAD = dataAD{1,1};
    [numAD,lengthAD] = size(dataAD);

    tempNC = reshape(dataNC,[1,numNC*lengthNC]);
    tempNC = reshape(mapminmax(tempNC,0,1),[numNC,lengthNC]);

    tempAD = reshape(dataAD,[1,numAD*lengthAD]);
    tempAD = reshape(mapminmax(tempAD,0,1),[numAD,lengthAD]);


    for n = 1:numNC
       outputNC(n,i:i+3) = tempNC(n,1:4); 
    end

    for n = 1:numAD
       outputAD(n,i:i+3) = tempAD(n,1:4); 
    end

    i = i + 4;
end

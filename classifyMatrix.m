clear; clc; close all;
%�Դ���õ�AD��NC���ݽ��бȽ�

way = '2';
min = ['min',way,'F'];
state = 'result';
path = 'data171126/';
outPath = 'data171212/1_2_23_24/';



%�������ݲ���һ����0~100����һ����Ϻ������������
dataNC = load([path,state,'F',min,'NC.mat']);
dataNC = struct2cell(dataNC);
dataNC = dataNC{1,1};
[numNC,lengthNC] = size(dataNC);

dataAD = load([path,state,'F',min,'AD.mat']);
dataAD = struct2cell(dataAD);
dataAD = dataAD{1,1};
[numAD,lengthAD] = size(dataAD);

outputNC = zeros(numNC,16);
outputAD = zeros(numAD,16);
i = 1;

tempNC = reshape(dataNC,[1,numNC*lengthNC]);
tempNC = reshape(mapminmax(tempNC,0,1),[numNC,lengthNC]);
save ([outPath,state,'FNor','NC',min,'.mat'],'tempNC');

tempAD = reshape(dataAD,[1,numAD*lengthAD]);
tempAD = reshape(mapminmax(tempAD,0,1),[numAD,lengthAD]);
save ([outPath,state,'FNor','AD',min,'.mat'],'tempAD');


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

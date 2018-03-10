clear; clc; close all;
%对处理好的AD和NC数据进行比较

way = '3';
min = ['min',way];
state = 'result';

output = zeros(32,4);
i = 1;

%载入NC和AD的去离群点前非归一化数据进行对比
for n = 1:4
    if (n == 2)
        min = ['min',way,'F'];
    end
    
    if (n == 3)
        min = ['min',way];
        state = 'nor_';
    end
    
    if (n == 4)
        min = ['min',way,'F'];
    end
    
    dataNC = load([state,'F',min,'NC.mat']);
    dataNC = struct2cell(dataNC);
    dataNC = dataNC{1,1};
    [numNC,lengthNC] = size(dataNC);

    dataAD = load([state,'F',min,'AD.mat']);
    dataAD = struct2cell(dataAD);
    dataAD = dataAD{1,1};
    [numAD,lengthAD] = size(dataAD);

     for j = 1:lengthNC
          [h,p] = ttest2(dataNC(1:numAD,j),dataAD(:,j));
          output(i,j) = p;
     end
     i = i + 1;

     for j = 1:lengthNC
          [h,p] = ttest2(dataNC(numNC - numAD + 1:numNC,j),dataAD(:,j));
          output(i,j) = p;
     end
     i = i + 1;

     dataNC = load([state,'logS',min,'NC.mat']);
    dataNC = struct2cell(dataNC);
    dataNC = dataNC{1,1};
    [numNC,lengthNC] = size(dataNC);

    dataAD = load([state,'logS',min,'AD.mat']);
    dataAD = struct2cell(dataAD);
    dataAD = dataAD{1,1};
    [numAD,lengthAD] = size(dataAD);

     for j = 1:lengthNC
          [h,p] = ttest2(dataNC(1:numAD,j),dataAD(:,j));
          output(i,j) = p;
     end
     i = i + 1;

     for j = 1:lengthNC
          [h,p] = ttest2(dataNC(numNC - numAD + 1:numNC,j),dataAD(:,j));
          output(i,j) = p;
     end
     i = i + 1;

     dataNC = load([state,'logU',min,'NC.mat']);
    dataNC = struct2cell(dataNC);
    dataNC = dataNC{1,1};
    [numNC,lengthNC] = size(dataNC);

    dataAD = load([state,'logU',min,'AD.mat']);
    dataAD = struct2cell(dataAD);
    dataAD = dataAD{1,1};
    [numAD,lengthAD] = size(dataAD);

     for j = 1:lengthNC
          [h,p] = ttest2(dataNC(1:numAD,j),dataAD(:,j));
          output(i,j) = p;
     end
     i = i + 1;

     for j = 1:lengthNC
          [h,p] = ttest2(dataNC(numNC - numAD + 1:numNC,j),dataAD(:,j));
          output(i,j) = p;
     end
     i = i + 1;

     dataNC = load([state,'logZ',min,'NC.mat']);
    dataNC = struct2cell(dataNC);
    dataNC = dataNC{1,1};
    [numNC,lengthNC] = size(dataNC);

    dataAD = load([state,'logZ',min,'AD.mat']);
    dataAD = struct2cell(dataAD);
    dataAD = dataAD{1,1};
    [numAD,lengthAD] = size(dataAD);

     for j = 1:lengthNC
          [h,p] = ttest2(dataNC(1:numAD,j),dataAD(:,j));
          output(i,j) = p;
     end
     i = i + 1;

     for j = 1:lengthNC
          [h,p] = ttest2(dataNC(numNC - numAD + 1:numNC,j),dataAD(:,j));
          output(i,j) = p;
     end
     i = i + 1;
end
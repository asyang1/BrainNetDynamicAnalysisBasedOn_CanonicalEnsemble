%�Խ�����д�������

path = 'data171205\com\';

way = '2';
min = ['min',way];
state = 'AD';

%���ȱ���ȥ��Ⱥ��ǰ������
eval(['resultF',min ,state,' =  resultF']);
eval(['resultlogS',min ,state,' =  resultlogS']);
eval(['resultlogU',min ,state,' =  resultlogU']);
eval(['resultlogZ',min ,state,' =  resultlogZ']);

save ([path,'resultF',min,state,'.mat'],['resultF',min,state]);
save ([path,'resultlogS',min,state,'.mat'],['resultlogS',min,state]);
save ([path,'resultlogU',min,state,'.mat'],['resultlogU',min,state]);
save ([path,'resultlogZ',min,state,'.mat'],['resultlogZ',min,state]);

%Ȼ���ȥ��Ⱥ��ǰ�����ݽ��й�һ��������
nor_F = mapminmax(resultF,0,1);
nor_logS = mapminmax(resultlogS,0,1);
nor_logU = mapminmax(resultlogU,0,1);
nor_logZ = mapminmax(resultlogZ,0,1);

eval(['nor_F',min ,state,' =  nor_F']);
eval(['nor_logS',min ,state,' =  nor_logS']);
eval(['nor_logU',min ,state,' =  nor_logU']);
eval(['nor_logZ',min ,state,' =  nor_logZ']);

save ([path,'nor_F',min ,state,'.mat'],['nor_F',min ,state]);
save ([path,'nor_logS',min,state,'.mat'],['nor_logS',min,state]);
save ([path,'nor_logU',min,state,'.mat'],['nor_logU',min,state]);
save ([path,'nor_logZ',min,state,'.mat'],['nor_logZ',min,state]);

%����ȥ��Ⱥ�����
%������ԭ�����ȥ��Ⱥ��
[num,time] = size(resultlogS);
flag  =1;
for i = 1: num
    k = resultlogS(i,1) + resultlogS(i,2) - (resultlogS(i,3) + resultlogS(i,4));
   if(k < 0)
       ob(flag,1) = i; 
       flag = flag +1;
       fprintf('%d\n',i);
   end
end

[n1,n2] = size(ob);

for i = n1:-1:1
    k = ob(i,1);
   resultF(k,:) = []; 
   resultlogS(k,:) = []; 
   resultlogU(k,:) = []; 
   resultlogZ(k,:) = []; 
end

%����ȥ��Ⱥ��������
min = ['min',way,'F'];
eval(['resultF',min ,state,' =  resultF']);
eval(['resultlogS',min ,state,' =  resultlogS']);
eval(['resultlogU',min ,state,' =  resultlogU']);
eval(['resultlogZ',min ,state,' =  resultlogZ']);

save ([path,'resultF',min,state,'.mat'],['resultF',min,state]);
save ([path,'resultlogS',min,state,'.mat'],['resultlogS',min,state]);
save ([path,'resultlogU',min,state,'.mat'],['resultlogU',min,state]);
save ([path,'resultlogZ',min,state,'.mat'],['resultlogZ',min,state]);

%��ȥ��Ⱥ�������ݽ��й�һ��������
nor_F = mapminmax(resultF,0,1);
nor_logS = mapminmax(resultlogS,0,1);
nor_logU = mapminmax(resultlogU,0,1);
nor_logZ = mapminmax(resultlogZ,0,1);

eval(['nor_F',min ,state,' =  nor_F']);
eval(['nor_logS',min ,state,' =  nor_logS']);
eval(['nor_logU',min ,state,' =  nor_logU']);
eval(['nor_logZ',min ,state,' =  nor_logZ']);

save ([path,'nor_F',min ,state,'.mat'],['nor_F',min ,state]);
save ([path,'nor_logS',min,state,'.mat'],['nor_logS',min,state]);
save ([path,'nor_logU',min,state,'.mat'],['nor_logU',min,state]);
save ([path,'nor_logZ',min,state,'.mat'],['nor_logZ',min,state]);
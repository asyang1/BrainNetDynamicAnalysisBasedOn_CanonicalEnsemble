% plot(x,y(:,1),'r',x,y(:,2),'b')
% legend('ʵ�⹦��','���ݹ���')
% ylabel('����/dB')
% xlabel('����/m')
% title('���ݹ�����ʵ�⹦�ʶԱ�����')
% 

%������ԭ�����ȥ��Ⱥ��
% flag  =1;
% for i = 1: 116
%     k = resultlogS(i,1) + resultlogS(i,2) - (resultlogS(i,3) + resultlogS(i,4));
%    if(k < 0)
%        ob(flag,1) = i; 
%        flag = flag +1;
%        fprintf('%d\n',i);
%    end
% end
% 
% [n1,n2] = size(ob);
% 
% for i = n1:-1:1
%     k = ob(i,1);
%    resultF(k,:) = []; 
%    resultlogS(k,:) = []; 
%    resultlogU(k,:) = []; 
%    resultlogZ(k,:) = []; 
% end

%ת����GRETNA-master�е�gretna_plot_bar��Ҫ�����ݸ�ʽ
% temp = cell(1,4);
% for i = 1:4
%    temp{1,i} = tempAD(:,i); 
% end

%ȡ��matlab�������������
[rAD,vAD] = size(outputAD);
[rNC,vNC] = size(outputNC);
label=[ones(rAD,1);zeros(rNC,1)];
feature=[outputAD;outputNC];
TBL_nods=table(label,feature,'VariableNames',{'Label' 'Features'});

% �ֱ������Ӿ����������з���
% [rAD,vAD] = size(oAD);
% [rNC,vNC] = size(oNC);
% label=[ones(rAD,1);zeros(rNC,1)];
% feature=[oAD;oNC];
% TBL_nods=table(label,feature,'VariableNames',{'Label' 'Features'});

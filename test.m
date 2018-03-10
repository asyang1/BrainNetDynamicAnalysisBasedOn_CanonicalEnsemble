% plot(x,y(:,1),'r',x,y(:,2),'b')
% legend('实测功率','反演功率')
% ylabel('功率/dB')
% xlabel('距离/m')
% title('反演功率与实测功率对比曲线')
% 

%根据熵原理进行去离群点
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

%转换成GRETNA-master中的gretna_plot_bar需要的数据格式
% temp = cell(1,4);
% for i = 1:4
%    temp{1,i} = tempAD(:,i); 
% end

%取得matlab工具箱输入参数
[rAD,vAD] = size(outputAD);
[rNC,vNC] = size(outputNC);
label=[ones(rAD,1);zeros(rNC,1)];
feature=[outputAD;outputNC];
TBL_nods=table(label,feature,'VariableNames',{'Label' 'Features'});

% 分别输入视觉和听觉进行分类
% [rAD,vAD] = size(oAD);
% [rNC,vNC] = size(oNC);
% label=[ones(rAD,1);zeros(rNC,1)];
% feature=[oAD;oNC];
% TBL_nods=table(label,feature,'VariableNames',{'Label' 'Features'});

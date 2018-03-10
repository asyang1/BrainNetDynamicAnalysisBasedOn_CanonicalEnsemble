%对数据进行归一化
% [r,v] = size(resultF);
% nor_F = reshape(resultF,[1,r*v]);
% nor_F = reshape(mapminmax(nor_F,0,1),[r,v]);
% 
% nor_logS = reshape(resultlogS,[1,r*v]);
% nor_logS = reshape(mapminmax(nor_logS,0,1),[r,v]);
% 
% nor_logU = reshape(resultlogU,[1,r*v]);
% nor_logU = reshape(mapminmax(nor_logU,0,1),[r,v]);
% 
% nor_logZ = reshape(resultlogZ,[1,r*v]);
% nor_logZ = reshape(mapminmax(nor_logZ,0,1),[r,v]);

nor_F = mapminmax(resultF,0,1);

nor_logS = mapminmax(resultlogS,0,1);

nor_logU = mapminmax(resultlogU,0,1);

nor_logZ = mapminmax(resultlogZ,0,1);

% nor_Fmin2NC = mapminmax(resultFmin2NC,0,1);
% 
% nor_logSmin2NC = mapminmax(resultlogSmin2NC,0,1);
% 
% nor_logUmin2NC = mapminmax(resultlogUmin2NC,0,1);
% 
% nor_logZmin2NC = mapminmax(resultlogZmin2NC,0,1);



% nor_Fmin2FNC = mapminmax(resultFmin2FNC,0,1);
% 
% nor_logSmin2FNC = mapminmax(resultlogSmin2FNC,0,1);
% 
% nor_logUmin2FNC = mapminmax(resultlogUmin2FNC,0,1);
% 
% nor_logZmin2FNC = mapminmax(resultlogZmin2FNC,0,1);
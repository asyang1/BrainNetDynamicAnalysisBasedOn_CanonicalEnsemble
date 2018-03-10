% boxplot(tempAD);
% set(gca,'Xticklabel',{'Precentral_L','Precentral_R','Frontal_Sup_Medial_L','Frontal_Sup_Medial_R'});
% ylabel('Normalized F');
% xlabel('Regions');

% boxplot(tempNC);
% set(gca,'Xticklabel',{'Calcarine_L','Calcarine_R','Heschl_L','Heschl_R'});
% ylabel('Normalized F');
% xlabel('Regions');

gretna_plot_bar(temp,  {'Calcarine_L','Calcarine_R','Heschl_L','Heschl_R'},{'Normalized F'}, 'sd')
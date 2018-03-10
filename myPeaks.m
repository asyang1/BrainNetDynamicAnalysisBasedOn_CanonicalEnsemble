function [pks ] = myPeaks( dataZscore)

[r,c] = size(dataZscore);
 pks = cell(r,4);
for i =1:r
    [tpks,loc,w,p] = findpeaks(dataZscore(i,:));
    
    pks{i,1} = tpks;
    pks{i,2} = loc;
    pks{i,3} = w;
    pks{i,4} = p;
    
end
function [pks_min ] = myPeaksmin( dataZscore,pks)
[r,c] = size(dataZscore);
 pks_min = cell(r,4);
for i =1:r
    [tpks,loc,w,p] = findpeaks(-dataZscore(i,:));
    
    locM =  pks{i,2};
    if locM(1) - loc(1) < 0
        
        [rT,cT] = size(loc);
        temp = zeros(1,cT+1);
        
        temp(1) =  -dataZscore(i,1);
        temp(2:cT+1) = tpks;
        
        tpks = temp;
        
        temp(1) = 1;
        temp(2:cT+1) = loc;
        
        loc = temp;
        
    end
    
    pks_min{i,1} = -tpks;
    pks_min{i,2} = loc;
    pks_min{i,3} = w;
    pks_min{i,4} = p;
    
end
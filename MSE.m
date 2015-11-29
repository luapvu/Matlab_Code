function [i, j, val] = MSE( Yc,Uc,Vc, Yr,Ur,Vr mbSize)
currentYFrame = Yc{1,1}(1,1);
currentUFrame = Uc{1,1}(1,1);
currentVFrame = Vc{1,1}(1,1);

referenceYFrame = Yr{1,2}(1,1);
referenceUFrame = Ur{1,2}(1,1);
referenceVFrame = Vr{1,2}(1,1);

MBSIZE = mbSize;
sum = 0;
k = 1;
 for i = 1:144
    
     for j = 1:176
       val = Y{1,i}(k,j)
     i = i
     j = j
     end
      k = k+1
    
 end
 


end



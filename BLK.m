function [ filteredBlock ] = BLK(previousFrame, currentFrame, nextFrame, y, x, Kbm, Kbl)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here


Pkk_1 = GetTemporalVariance(currentFrame, previousFrame, y, x);
Pkk_2 = GetTemporalVariance(nextFrame, currentFrame, y, x);
Xkk_1(16,16) = 0;
Xkk_2(16,16) = 0;

for i=0:15
    for j=0:15
        Xkk_1(i+1,j+1)= (currentFrame(y+i,x+j) + previousFrame(y+i,x+j))/2;
        Xkk_2(i+1,j+1)= (currentFrame(y+i,x+j) + nextFrame(y+i,x+j))/2;
    end
end

Kk_1 = Pkk_1 / (Pkk_1 + Kbm);
Kk_2 = Pkk_2 / (Pkk_2 + Kbl);

Xkfinal_1 = Xkk_1 + Kk_1 * (currentFrame(y:y+15,x:x+15) - Xkk_1);
Xkfinal_2 = Xkk_2 + Kk_2 * (currentFrame(y:y+15,x:x+15) - Xkk_2);

filteredBlock = (Xkfinal_1 + Xkfinal_2)/2;

%currentFrame(y:y+15,x:x+15) = Xk_avg;

end


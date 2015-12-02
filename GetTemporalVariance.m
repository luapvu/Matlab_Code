function [ variance ] = GetTemporalVariance( currentFrame, referenceFrame, x, y)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
temp = 0;
average = 0;
%Average of frame
for i=0:15
    for j=0:15
        average=average+ ((currentFrame(i+y,j+x)+(referenceFrame(i+y,j+x))));
    end
end
average = average/(2*16*16);

%solving for variance
    for i=0:15
        for j=0:15
            temp=temp+((( currentFrame(i+y,j+x)+referenceFrame(i+y,j+x))/2 -average ));
        end
    end
    
    variance = temp /(16*16);
end


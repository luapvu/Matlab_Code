function [ filteredUBlock ] = CalculateAnl( currentFrame, y, x )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    
    for i=0:3
        for j=0:3
            pixelValueVariance1 = Get_Variance(currentFrame, y+i-1,x+j-1,0,0,2); 
            pixelValueVariance2 = Get_Variance(currentFrame, y+i,x+j,0,0,2);
            
            pixelValueMean1 = GetANLMean(currentFrame, y+i-1,x+j-1);
            pixelValueMean2 = GetANLMean(currentFrame, y+i,x+j);
            
            ratio = pixelValueVariance1/pixelValueVariance2;
            
            temp1 = ratio/(1+ratio);
            temp2 = 1-temp1;
            
            if pixelValueVariance1 < pixelValueVariance2
                filteredUBlock(i+1,j+1) = temp1*pixelValueMean1+temp2*pixelValueMean2;
            else
                filteredUBlock(i+1,j+1) = temp2*pixelValueMean1+temp1*pixelValueMean2;
            end
        end
    end

end

function [mean] = GetANLMean(currentFrame, y, x)
    mean = 0;
    w = 176;
    h = 144;
    for i = 0:1
        for j = 0:1
            if (y + i < 1) || (y + i + 1 >= h) || (x + j < 1) || (x + j + 1 >= w)
                continue
            end
            mean = mean + currentFrame(y+i,x+j);
        end
    end
    
    mean = mean / 4;

end



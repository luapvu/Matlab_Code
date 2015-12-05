function [ filteredUBlock ] = CalculateAnl( currentFrame, y, x )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    filteredUBlock(4,4)=0;
    
    for i=0:3
        for j=0:3
            
            pixelValueVariance(1) = Get_Variance(currentFrame, y+i-1,x+j-1,0,0,2); 
            pixelValueVariance(2) = Get_Variance(currentFrame, y+i,x+j,0,0,2);
            pixelValueVariance(3) = Get_Variance(currentFrame, y+i+1,x+j,0,0,2);
            pixelValueVariance(4) = Get_Variance(currentFrame, y+i,x+j-1,0,0,2);
            
            pixelValueMean(1) = GetANLMean(currentFrame, y+i-1,x+j-1);
            pixelValueMean(2) = GetANLMean(currentFrame, y+i,x+j);
            pixelValueMean(3) = GetANLMean(currentFrame, y+i+1,x+j);
            pixelValueMean(4) = GetANLMean(currentFrame, y+i,x+j-1);
            weight(4)=0;
            
            for k=1:4
                weight(k) = pixelValueVariance(k)/(pixelValueVariance(1)+pixelValueVariance(2)+pixelValueVariance(3)+pixelValueVariance(4));
            end
            weight = sort(weight);
            
            weighted_avg = 0;
            % Largest variance (fucked up) associated with smallest
            % weighting which is multiplied by its mean
            for l=1:4
                [maximum_var, index_var] = max(pixelValueVariance);
                pixelValueVariance(index_var) = -1;
                
                weighted_avg = weighted_avg + (pixelValueMean(index_var)*weight(l));
            end
            
            
            %ratio = pixelValueVariance1/pixelValueVariance2;
            
            %temp1 = ratio/(1+ratio);
            %temp2 = 1-temp1;
            filteredUBlock(i+1,j+1) = weighted_avg;

            
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



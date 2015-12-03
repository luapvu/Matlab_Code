function [ filteredBlock ] = ANL( currentFrame, y, x )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    currentMBVariance = Get_Variance(currentFrame, y, x, 0, 0, 16);
    uBlockVariance(4,4)=0;
    
    filteredBlock = currentFrame(y:y+15,x:x+15);

    for i=0:4:15
        for j=0:4:15
            uBlockVariance(i+1,j+1) = Get_Variance(currentFrame, y+i, x+j, 0, 0, 4);
            
            if currentMBVariance < uBlockVariance(i+1,j+1)
                filteredUBlock = CalculateAnl(currentFrame, y+i, x+j);
                filteredBlock(i+1:i+4,j+1:j+4) = filteredUBlock;
            end
        end
    end
    
end


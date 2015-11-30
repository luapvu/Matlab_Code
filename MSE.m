function [MSE ] = MSE( Y, MB_width, MB_height, frameSize)
MSE = 0
for i = 1:MB_width*MB_height

    for j = 1:MB_width*MB_height
    MSE = MSE + (abs(Y{1:i}(1,j) - Y{1:i}(1 , j+1)))
    end
end




end


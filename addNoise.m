function [ Y_noise, U_noise, V_noise ] = addNoise( Y, U ,V , numFrames, frameHeight, frameWidth)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%calculating the height and width of UV frame, which is 1/2 length of Y
UV_Height = frameHeight / 2
UV_Width = frameWidth / 2

%adding noise to the Y frame
for i = 1:numFrames
    Y_noise{1,i} = Y{1,i} + 5*randn(frameHeight,frameWidth)
end

%adding noise to the U frame
for j = 1:numFrames
    U_noise{1,j} = U{1,j} + 5*randn(UV_Height,UV_Width)
end

%adding noise to the V frame
for k = 1:numFrames
    V_noise{1,k} = V{1,k} + 5*randn(UV_Height, UV_Width)
end



end


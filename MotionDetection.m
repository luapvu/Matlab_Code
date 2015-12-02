function [ Flag ] = MotionDetection( previousFrame, currentFrame, nextFrame, y, x )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    Kbm = 0;
    Kbl = 0;

    [iMV_Fwdy, iMV_Fwdx] = MBMotionEstimation(currentFrame, previousFrame, y, x);
    [iMV_Bkwdy, iMV_Bkwdx] = MBMotionEstimation(currentFrame, nextFrame, y, x);

    %disp('iMV_Fwdy:');
    %disp(iMV_Fwdy);
    %disp('iMV_Fwdx:');
    %disp(iMV_Fwdx);
    %disp('iMV_Bkwdy:');
    %disp(iMV_Bkwdy);
    %disp('iMV_Bkwdx:');
    %disp(iMV_Bkwdx);
    
    for i = 0:15
        for j = 0:15 
            Kbm = Kbm + abs(currentFrame(y+i,x+j)-previousFrame(y+iMV_Bkwdy+i,x+iMV_Bkwdx+j));
            Kbl = Kbl + abs(currentFrame(y+i,x+j)-nextFrame(y+iMV_Fwdy+i,x+iMV_Fwdx+j));
        end
        
    end    
    Kbm = Kbm / (16*16);
    Kbl = Kbl / (16*16);
    
    disp('Kbm:');
    disp(Kbm);
    disp('Kbl:');
    disp(Kbl);
    
    variance_prev = Get_Variance(currentFrame, y, x, iMV_Bkwdy, iMV_Bkwdx);
    %disp('variance_prev:');
    %disp(variance_prev);
    variance_next = Get_Variance(currentFrame, y, x, iMV_Fwdy, iMV_Fwdx);
    
    variance_current = Get_Variance(currentFrame, y, x, 0, 0);
    %disp('variance_next:');
    %disp(variance_next);
    T = min([variance_prev,variance_next,variance_current]);
    
    if (Kbm < T) && (Kbl < T)
        Flag = false;
    else
        Flag = true;
    end
    
    
end


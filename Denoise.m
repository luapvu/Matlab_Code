function [Y_denoised] = Denoise(Y_noisy, numberOfFrames)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here


Y_denoised{1,numberOfFrames-2}(144, 176) = 0;
motion_flags(99) = 0;
Kbm(99) = 0;
Kbl(99) = 0;

for frame = 2:numberOfFrames-1
    i = 1;
    for y=1:16:144
        for x=1:16:176
            disp('frame: ');
            disp(frame);
            [motion_flags(i), Kbm(i), Kbl(i)] = MotionDetection(Y_noisy{1,frame-1}, Y_noisy{1,frame}, Y_noisy{1,frame+1}, y, x);
            
            if ~(motion_flags(i))
                Y_denoised{1,frame}(y:y+15,x:x+15)=BLK(Y_noisy{1,frame-1}, Y_noisy{1,frame}, Y_noisy{1,frame+1}, y, x, Kbm(i), Kbl(i));
            end
        end
    end
end

function [iMVy, iMVx] = MBMotionEstimation(currentFrame, referenceFrame, y, x)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

% For testing
mbSize = 16;
w = 176;
h = 144;
small_motion = false;

iMVy = 0;
iMVx = 0;

step_size_lm = 4;
step_size_sm = 1;


iSAD0 = GetSAD(currentFrame, referenceFrame, y, x, 0, 0, 65535);

% Large motion
for i = -step_size_lm:step_size_lm:step_size_lm
    for j = -step_size_lm:step_size_lm:step_size_lm

        % Check for boundary condtions
        %
        if (y + i < 1) || (y + i + mbSize >= h) || (x + j < 1) || (x + j + mbSize >= w)
            continue
        end
        %disp('y + i < 1: ');  disp((y + i));
        %disp('y + i + mbSize >= h: '); disp((y + i + mbSize));
        %disp('x + j < 1: '); disp((x + j));
        %disp('x + j + mbSize >= w: '); disp((x + j + mbSize));

        iSAD = GetSAD(currentFrame, referenceFrame, y, x, i, j, iSAD0);

        if iSAD < (iSAD0 * 0.925)
            iSAD0 = iSAD;
            iMVy = i;
            iMVx = j;
        end
    end
end

% Small motion
for i = -step_size_sm:step_size_sm:step_size_sm
    for j = -step_size_sm:step_size_sm:step_size_sm
        % Check for boundary condtions
        %
        if (y + i < 1) || (y + i + mbSize >= h) || (x + j < 1) || (x + j + mbSize >= w)
            continue
        end
        
        
        % We already checked (0,0)
        if (i==0) && (j==0)
            continue
        end
        
        iSAD = GetSAD(currentFrame, referenceFrame, y, x, i, j, iSAD0);
        
        if iSAD < (iSAD0 * 0.925)
            iSAD0 = iSAD;
            iMVy = i;
            iMVx = j;
            small_motion = true; % So we know to continue with the small motion version of the algorithm
        end
    end
end

% Finish small motion
if small_motion
    for i = -step_size_sm:step_size_sm:step_size_sm
        for j = -step_size_sm:step_size_sm:step_size_sm
            % Check for boundary condtions
            %
            if (y + i < 1) || (y + i + mbSize >= h) || (x + j < 1) || (x + j + mbSize >= w)
                continue
            end


            % We already checked (0,0)
            if (i==0) && (j==0)
                continue
            end

            iSAD = GetSAD(currentFrame, referenceFrame, y, x, i, j, iSAD0);

            if iSAD < (iSAD0 * 0.925)
                iSAD0 = iSAD;
                iMVy = i;
                iMVx = j;
            end
        end
    end
% Finish large motion
else
    % Divide step size by 2
    step_size_lm = step_size_lm / 2;
    
    while step_size_lm >= 1
        for i = -step_size_lm:step_size_lm:step_size_lm
            for j = -step_size_lm:step_size_lm:step_size_lm
                % Check for boundary condtions
                %
                if (y + i < 1) || (y + i + mbSize >= h) || (x + j < 1) || (x + j + mbSize >= w)
                    continue
                end

                % We already checked (0,0)
                if (i==0) && (j==0)
                    continue
                end
                
                iSAD = GetSAD(currentFrame, referenceFrame, y, x, i, j, iSAD0);

                if iSAD < (iSAD0 * 0.925)
                    iSAD0 = iSAD;
                    iMVy = i;
                    iMVx = j;
                end
            end
        end
        % Divide step size by 2
        step_size_lm = step_size_lm / 2;
    end
    
end

end


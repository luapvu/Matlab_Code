function [iMVy, iMVx] = MBMotionEstimation(currentFrame, referenceFrame, y, x)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

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
        %
        
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
        %
        
        
        % We already checked (0,0)
        if (i==0) && (j==0)
            continue
        end
        
        iSAD = GetSAD(currentFrame, referenceFrame, y, x, i, j, iSAD0);
        
        if iSAD < (iSAD0 * 0.925)
            iSAD0 = iSAD;
            iMVy = i;
            iMVx = j;
            small_motion = TRUE; % So we know to continue with the small motion version of the algorithm
        end
    end
end

% Finish small motion
if small_motion
    for i = -step_size_sm:step_size_sm:step_size_sm
        for j = -step_size_sm:step_size_sm:step_size_sm
            % Check for boundary condtions
            %
            %


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
                %

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


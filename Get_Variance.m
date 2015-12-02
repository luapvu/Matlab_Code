function [variance] = Get_Variance(currentFrame, y, x, iMVy, iMVx)

%Do not callwhen frame is equal to 1

%Average of frame
%Average = GetSAD(currentFrame, referenceFrame, y, x, 0, 0, 10000000000);
%Average=Average/(16*16);
%average = 0;
%for i=0:15
%    for j=0:15
%        average=average+ ((currentFrame(i+y,j+x)+(referenceFrame(i+y,j+x))));
%    end
%end
%average = average/(2*16*16);
temp=0;
variance=0;
%disp('Average: ');
%disp(average);

%solving for variance
    for i=0:15
        for j=0:15
            %incrementing through the block
            %temp=temp+ ( (abs( (currentFrame(i+y,j+x))-(referenceFrame(i+y,j+x))) -Average )*(abs( (currentFrame(i+y,j+x))-(referenceFrame(i+y,j+x))) -Average));
            %temp=temp+((( currentFrame(i+y,j+x)+referenceFrame(i+y,j+x))/2 -average )*(( currentFrame(i+y,j+x)+referenceFrame(i+y,j+x))/2 -average ));
            %disp(currentFrame(i+y,j+x));
            %disp(referenceFrame(i+y,j+x));
            temp = temp + (currentFrame(i+y+iMVy,j+x+iMVx));
            
        end 

    end
    %return only a single variable 
    average = temp/(16*16);
    for i=0:15
        for j=0:15
            variance = variance + abs((currentFrame(i+y+iMVy,j+x+iMVx))-average);
        end
    end
    
    variance = variance / (16*16);
    
    %disp('Current Frame: ');
    %disp(currentFrame);
    %disp('Reference Frame: ');
    %disp(referenceFrame);
    %disp('temp: ');
    %disp(temp);
    disp('variance: ');
    disp(variance);
end


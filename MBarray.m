function [ mb_array ] = MBarray( Y, mbsizeW, mbsizeH, frameH, frameW)

%width of the macro block, typically 16
low_width = 1
high_width = mbsizeW

%height of the macroblock, typically 16 low-high is 1:16, we need these
%variables to dynamically calculate all the macroblocks in the for loops

low_height = 1
high_height = mbsizeH
initialLength = 1

verticalMB = frameH / mbsizeH 
horizontalMB = frameW / mbsizeW




%for loop to calculate all the macro blocks vertically
for a = 1:verticalMB
    
    %for loop to calculate all the macro blocks horizontally initial length
    %should be 
   for row = initialLength: initialLength + (horizontalMB -1)
        for column = low_width : high_width
        mb_array{row} = Y([low_height:high_height],[low_width:high_width])

        end
        %after it exits the above for loop, it will have finished
        %calculating all the macroblocks in the row,  we reset the below
        %variables so when the loop iterates again for the next row
        low_width = high_width +1
        high_width = high_width + mbsizeW
  
    
   end
    low_width = 1
    high_width = mbsizeW
    low_height = high_height + 1
    high_height = high_height + mbsizeH
    initialLength = initialLength + horizontalMB
    
end
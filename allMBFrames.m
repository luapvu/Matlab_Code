function [ mb_of_each_frame ] = allMBFrames( Y, mbsizeW, mbsizeH, frameH, frameW, n_frames)
% Y = y frame
% mbsizeW = Width of the macro block, typically 16
% mbsizeH = height of the macro block, typically 16
% frameH = height of frame typically 144 for qcif
% frameW = width of frame typically 176 for qcif
% n_frames = number of frames in the qcif video clip

%iterates for all the frames, typically 1:N_frames
for i = 1:n_frames
    
%calculates macro blocks of all frames in the YUV file
mb_of_each_frame{1,i} = MBarray( Y{1,i},mbsizeW, mbsizeH, frameH, frameW)

end
end


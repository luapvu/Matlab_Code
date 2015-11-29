
%function imports a qcif file, and adds gaussian white noise to the video
%file, and exports this file to the user as noised.qcif
function simulateGNoise( fileName, frameWidth, frameHeight, numFrames )

%calling import function to import the filename
[Y, U, V] = yuv_import(fileName,[frameWidth frameHeight],numFrames);

%adding gaussian noise to the imported frames and storing in Y1, U1, V1
[Y1, U1, V1] = addNoise( Y, U ,V , numFrames, frameHeight, frameWidth)

%exporting the noised YUV components
yuv_export(Y1,U1,V1,'noised.qcif', numFrames)



end


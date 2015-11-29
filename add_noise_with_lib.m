[Y, U, V] = yuv_import('paul.qcif',[176 144],300);

 for n_frames = 1:300
 	V_noisy{1,n_frames} = V{1,n_frames} + 5*randn(72,88);
 end

yuv_export(Y_noisy,U_noisy,V_noisy,'noise.y4m',300);
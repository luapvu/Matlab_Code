qcif_file = fopen('glas40.qcif');

qcif_yuv_components = fread(qcif_file);

% Grab first Y component

first_y(144,176) = 0;

% Grab all the x values
for y = 1:144
    for x = 1:176
        first_y(y,x) = qcif_yuv_components((y-1)*176+x);
    end
end

%image(first_y);

noisy_first_y = first_y + 5*randn(144,176);

image(noisy_first_y);
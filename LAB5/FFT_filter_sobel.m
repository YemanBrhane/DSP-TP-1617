%Apply the sobel lter only in vertical direction to `lena` image in the frequency domain.
%Create the Frequency Filtered Image

image_name=[pwd,'\images\lena-grey.bmp'];
Im_lena=imread(image_name);
figure, imshow(Im_lena,[])
title('Input image');
% Genrate sobel filter mask
h = fspecial('sobel');
% Padding size decission
[m, n]=size(Im_lena);
 max_Dim = max([m n]); %Maximum dimension.
   P = 2^nextpow2(2*max_Dim);
   PQ = [P, P];
% padd and copute the fft of the ibput image and the filter
% the size of the filter and the image must be the same for multiplication
F = fft2(double(Im_lena), PQ(1), PQ(2));
H = fft2(double(h), PQ(1), PQ(2));
F_fH = H.*F;
% Filtred image
ffi = ifft2(F_fH);
% Crop the image at its original size
ffi = ffi(2:size(Im_lena,1)+1, 2:size(Im_lena,2)+1);

%Display results
%The abs function gets correct magnitude
ffim = abs(ffi);
figure, imshow(ffim, []);
title('Filtered image');

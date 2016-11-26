clc;
close all;
clear all;
image_name=[pwd,'\images\lena-grey.bmp'];
Im_lena=imread(image_name);
imgFreq = fftshift(fft2(Im_lena));

figure('name', 'Lena Image');
subplot(311);imshow(Im_lena);
subplot(312); imagesc(log(abs(imgFreq))); colormap('gray'); title('Magnitude')
subplot(313); imagesc(angle(imgFreq)/pi*180); colormap('gray'); title('Phase')

imgFreq = (fft2(Im_lena));

mag1=abs(imgFreq);
phase1=angle(imgFreq);
% Lena Image constructed from Amplitude
r1=ifftshift(ifft2(mag1));

% Lena Imageconstructed from phase
r2=ifft2(exp(i*phase1));
figure('name', 'Lena Image constructed from Amplitude');
imshow(r1, []);
figure('name', 'Lena Imageconstructed from phase');
imshow(r2,[]);
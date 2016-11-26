
close all;
clc;
clear all;

%% Consider an synthetic image as following:
img = zeros(301,301);
img(100:200, 140:160) = 255;
figure(1);
imshow(img);

%% 1.2 we can compute the FFT as follows:
imgFreq = fftshift(fft2(img));
figure(1);
subplot(121); imagesc(abs(imgFreq)); colormap('gray'); title('Magnitude')
subplot(122); imagesc(angle(imgFreq)/pi*180); colormap('gray'); title('Phase')


%% Orginal
img = zeros(301,301);
img(100:200, 140:160) = 255;

imgFreq = fftshift(fft2(img));

figure('name', 'Orginal Image');
subplot(311);imshow(img);
subplot(312); imagesc(abs(imgFreq)); colormap('gray'); title('Magnitude')
subplot(313); imagesc(angle(imgFreq)/pi*180); colormap('gray'); title('Phase')

%% Translation
imgTrans = zeros(301,301);
imgTrans(150:250, 160:180) = 255;

imgFreq = fftshift(fft2(imgTrans));

figure('name', 'Effect of Translation');
subplot(311);imshow(imgTrans);
subplot(312); imagesc(abs(imgFreq)); colormap('gray'); title('Magnitude')
subplot(313); imagesc(angle(imgFreq)/pi*180); colormap('gray'); title('Phase')

% Observation: the rotation doesnot have any effect on the magnitude of FFT
% But it affects the phase of the FFT

%% Rotation
imgRot = imrotate(img, 45);
imgFreq = fftshift(fft2(imgTrans));
figure('name', 'Effect of Rotation');
subplot(311);imshow(imgRot);
subplot(312); imagesc(abs(imgFreq)); colormap('gray'); title('Magnitude')
subplot(313); imagesc(angle(imgFreq)/pi*180); colormap('gray'); title('Phase')

% Observation: the rotation doesnot have any effect on the magnitude of FFT
% But it affects the phase of the FFT

%% Having some two series bars
img2 = zeros(301,301);
img2(20:120, 140:160) = 255;
img2(180:280, 140:160) = 255;

imgFreq = fftshift(fft2(img2));
figure('name', 'Effect of having some two series bars');
subplot(311);imshow(img2);
subplot(312); imagesc(abs(imgFreq)); colormap('gray'); title('Magnitude')
subplot(313); imagesc(angle(imgFreq)/pi*180); colormap('gray'); title('Phase')

% Observation: Ifg we add another series bar will increase the intensity of  of the magnituide image
% There is also effect on the phase image but somehow difficult to describe
%% Having some two parallel bars
img3 = zeros(301,301);
img3(100:200, 145:155) = 255;
img3(100:200, 210:220) = 255;
imgFreq = fftshift(fft2(img3));


figure('name', 'Effect having some two parallel bars');
subplot(311);imshow(img3);
subplot(312); imagesc(abs(imgFreq)); colormap('gray'); title('Magnitude')
subplot(313); imagesc(angle(imgFreq)/pi*180); colormap('gray'); title('Phase')

%Observation: this has shifited the orientation of the the |f (u; 0)|and
%|f (0; v)| by 90 degree. and ofcourse has an effect on the phasae
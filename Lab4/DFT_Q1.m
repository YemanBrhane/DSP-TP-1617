function [  ] = DFT_Q1(  )
close all;
clc;
clear all;

% DFT of sine wave
figure('name','For sine function');
f = 5; fs = 50;
t = 0: 1/fs : 1-1/fs;
x_sin = sin(2*pi*f*t);
N = length(x_sin);
fr = (-N/2 : N/2-1)*fs/N;
%fr = (1 : N)*fs/N;
xf = ifftshift(fft(x_sin));
subplot(221); plot(t, x_sin); title('Signal'); xlabel('Time(sec)'); ylabel('Amplitude');
subplot(222); plot(fr, abs(xf)); title('Magnitude'); xlabel('Frequency'); ylabel('|X(f)|');
subplot(223); plot(fr, real(xf)); title('Real'); xlabel('Frequency'); ylabel('Re(X(f))');
subplot(224); plot(fr, imag(xf)); title('Imaginary'); xlabel('Frequency'); ylabel('Im(X(f))');


% ===============================================================

% DFT of cosine 
figure('name','For cosine');
x_cos = cos(2*pi*f*t);
N = length(x_cos);
fr = (-N/2 : N/2-1)*fs/N;
%fr = (1 : N)*fs/N;
xf_cos = ifftshift(fft(x_cos));
subplot(221); plot(t, x_cos); title('Signal'); xlabel('Time(sec)'); ylabel('Amplitude');
subplot(222); plot(fr, abs(xf_cos)); title('Magnitude'); xlabel('Frequency'); ylabel('|X(f)|');
subplot(223); plot(fr, real(xf_cos)); title('Real'); xlabel('Frequency'); ylabel('Re(X(f))');
subplot(224); plot(fr, imag(xf_cos)); title('Imaginary'); xlabel('Frequency'); ylabel('Im(X(f))');


% DISCUSSION
%The magnitude spectum of cosine and sine is same, while, but there is
%diffrence in the phase spectrum and real part as cosine and sine are outof
%phase each other 90 degree
%
%
%==================================================================
%DFT of Square
figure('name','For Square');
x_squar = square(2*f*pi*t); % generate square wave
N = length(x_squar);
fr = (-N/2 : N/2-1)*fs/N;
%fr = (1 : N)*fs/N;
xf_square = ifftshift(fft(x_squar));
subplot(221); plot(t, x_squar); title('Signal'); xlabel('Time(sec)'); ylabel('Amplitude');
subplot(222); plot(fr, abs(xf_square)); title('Magnitude'); xlabel('Frequency'); ylabel('|X(f)|');
subplot(223); plot(fr, real(xf_square)); title('Real'); xlabel('Frequency'); ylabel('Re(X(f))');
subplot(224); plot(fr, imag(xf_square)); title('Imaginary'); xlabel('Frequency'); ylabel('Im(X(f))');

% the DFT of the SQUARE WAVE IS like sinc function although it is not a
% perfect sinc

% ================================================================
%DFT of Guassian noice
figure('name','For Guassian Noise');
N = 10000; 
X = randn(1,N);
t=1:N;
% X_mean = mean(X);
% x_std = std(X);
fr = (-N/2 : N/2-1)*fs/N;
%fr = (1 : N)*fs/N;
xf_square = ifftshift(fft(X));

subplot(221); plot(t, X); title('Signal'); xlabel('Time(sec)'); ylabel('Amplitude');
subplot(222); plot(fr, abs(xf_square)); title('Magnitude'); xlabel('Frequency'); ylabel('|X(f)|');
subplot(223); plot(fr, real(xf_square)); title('Real'); xlabel('Frequency'); ylabel('Re(X(f))');
subplot(224); plot(fr, imag(xf_square)); title('Imaginary'); xlabel('Frequency'); ylabel('Im(X(f))');

% As can be seen from the DFT of GUASSIAN NOISE covers the whole spectrum
% as it is a whilte noise distributed over the whole frequency spectrum.
end


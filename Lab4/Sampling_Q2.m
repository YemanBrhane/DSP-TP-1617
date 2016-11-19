
%==========================================
% This code the DFT of a signal sampled at diffrent sampling Frequrncy

close all;
clear all;
clc;
f1 = 5 ; % Minimum frequency
f2 = 20;% Maximum frequency
T=1;
fs = [10; 20; 25; 40; 50; 100; 150]; % List of sampling Frequency

for i=1:length(fs)
    Ts=1/fs(i);
    N=T/Ts;
    n=1:N;
    x=3*cos(2*pi*f1/fs(i)*n)+4*sin(2*pi*f2/fs(i)*n);
    % title = sprintf('For Fs=%d',fs(i));

    % Time domain plot of the sampled signal
    
    figure('name','time');
    stem(n,x)
    title(['X[n] for fs= ' num2str(fs(i))]);
    ylabel('Magnitude'); ...
     xlabel('Time'); 
 
   % DFT plot of the sampled signal
    fr = (-N/2 : N/2-1)*fs(i)/N;
    xf = ifftshift(fft(x));
    figure('name','Frequency');
    plot(fr, abs(xf)); title('Magnitude'); ...
     title(['Xf for fs= ' num2str(fs(i))]);
     xlabel('Frequency'); ylabel('|X(f)|');

end
% The maximum frequency of x[n] is 20 herth. so, when we sample the signal
% the sampling frequency must be   GREATER THAN two times the maximum
% frequency of the the signal to be sampled. as it is depicted from the the
% from the DFt of the sampled signals there is no ALIASING when the fs>
% 2*20=40 herz also called Nyquist Sampling frequency, when the sampling 
%frequency is small the the lagrge frequency signal can't be recovered and
%thus it is not displayed in the output
%
clear all;
cla;
close all;
Im=0;
N=64;
T=1;
Ts=T/N;
Fs=1/Ts;
df=Fs/N;
Im(N/8:N/4,N/4+1:N/2)=1;
size(Im)
Im(1:N/4,N/2+1:N)=Im;
Im(N/4+1:N/2,:) = Im;
Im(N/2+1:3*N/4,:) = Im(1:N/4,:);
Im(3*N/4+1:N,:) = Im(1:N/4,:);

imgFreq = fftshift(fft2(Im));

fu0=imgFreq(N/2+1,:);
fr = (-N/2 : N/2-1);


figure; plot(fr,abs(fu0));  title('Magnitude of f(u,0)')
%figure; plot(fr,angle(fu0)/pi*180);  title('Phase of f(u,0)')

f0v=imgFreq(:,N/2+1);
figure; plot(fr,abs(f0v));  title('Magnitude of f(0,v)')
%figure; plot(fr,angle(f0v)/pi*180);  title('Phase of f(0,v)')

%Observation:
% Most of the signal power ius concentrated at center of the image or in
% the DC component
close all;
clc;
clear all;
% Lowpass
fc = 300;
fs = 1000;

%% Butterworth Filter
 % Fs/N this normalizes the freqiency and the 
figure('name','Butterworth Filter');
[b,a] = butter(3,fc/(fs));
[H, W ]= freqz(b,a)
subplot(2,2,1)
plot(W/pi,abs(H))
title('lowpass')

% High pass filter
[b,a] = butter(3,fc/(fs), 'high');
[H, W ]= freqz(b,a)
subplot(2,2,2)
plot(W/pi,abs(H))
title('Highpass');

%Band pass filter
fl=300;
fh=500;
[b,a] = butter(3,[fl fh]/(fs), 'bandpass');
[H, W ]= freqz(b,a)
subplot(2,2,3)
plot(W/pi,abs(H))
title('Bandpass');

%Band stop filter
fl=300;
fh=500;
[b,a] = butter(3,[fl fh]/(fs), 'stop');
[H, W ]= freqz(b,a);
subplot(2,2,4)
plot(W/pi,abs(H))
title('Band stop');

%% Chebcheb  Filter
 % Fs/N this normalizes the freqiency and the 
figure('name','chebcheb Filter');
[b,a] = cheby1(3,10,fc/(fs));
[H, W ]= freqz(b,a)
subplot(2,2,1)
plot(W/pi,abs(H))
title('lowpass')

% High pass filter
[b,a] = cheby1(3,10,fc/(fs), 'high');
[H, W ]= freqz(b,a)
subplot(2,2,2)
plot(W/pi,abs(H))
title('High pass');

%Band pass filter
fl=300;
fh=500;
[b,a] = cheby1(3,10,[fl fh]/(fs), 'bandpass');
[H, W ]= freqz(b,a)
subplot(2,2,3)
plot(W/pi,abs(H))
title('Band pass');

%Band stop filter
fl=300;
fh=500;
[b,a] = cheby1(3,10,[fl fh]/(fs), 'stop');
[H, W ]= freqz(b,a)
subplot(2,2,4)
plot(W/pi,abs(H))
title('Band stop');

%% low-pass response of the Chebychev-I filter
order=[3; 5; 10; 20];
figure('name','chebcheb Low pass Filter with different order');
for i=1:length(order)
    
[b,a] = cheby1(order(i),10,fc/(fs));
[H, W ]= freqz(b,a)
%subplot(2,2,1)
hold all
plot(W/pi,abs(H))
end
title('low-pass response of the Chebychev-I filter with different order');
legend('order=3','order=5','order=10','order=20');

% observation
% the higher the order the more ripple in the filter but it is it gives
% good gain in the low frequency for some frequency. It is diffucalt to say
% the higher the order the better is the filter as there to may ripples.




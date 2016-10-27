% Yeman Brhane HAGOs
% MAIA 
%LAB2
function []= Sin_Function()
Fs=20;
f=1;
N=2
T=1/f;
Ts=1/Fs;
n=0:Ts:N*T;
signal=sin(2*pi*f*n);
figure;
subplot(2,1,1);
stem(n,signal)
title('Decrete sine');
xlabel('t');
ylabel('Amplitude')
% continous
t=0:0.001:2*T;
y=sin(2*pi*f*t);
subplot(2,1,2);
plot(t,y);
title('Continous sine');
xlabel('t');
ylabel('Amplitude')
end
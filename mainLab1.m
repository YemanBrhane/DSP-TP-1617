%YEMAN BRHANE HAGOS
%MAIA STUDENT
clc;
clear all;
close all;
%% .................Question
n1=10;
N=20;
Signal=Dirac(n1, N );
% plot the sequence
figure(1);
stem(Signal);
title('Shifted Dirac fuction');
xlabel('n');
ylabel('P(K-n)');

%% ........Question2....
n=10;
N=20;
Signal=Step_Function( n, N );
% plot the sequence
figure(2);
stem(Signal);
title('Shifted Step');
xlabel('n');
ylabel('Value of the step');

%% ........Question3....
n=10;
N=20;
a=2;
Signal=Ramp_Function(a,n, N );
% plot the sequence
figure;
stem(Signal);
title('Shifted Ramp');
xlabel('n');
ylabel('Value of the scaled ramp');

%% ........Question4....
n=10;
N=20;
a=2;
Signal=Geo_Function(a,n, N );
% plot the sequence
figure;
stem(Signal);
title('Shifted exponential');
xlabel('n');
ylabel('Values');

%% ........Question5....
n=10;
N=20;
a=3;
Signal=Box_Function(a,n, N );
% plot the sequence
figure;
stem(Signal);
title('Box Function');
xlabel('n');
ylabel('Values');

%% ........Question6....
f=10;
N=1;
Fs=100;
[Signal,length]=Sine_Function(f,N,Fs );
% plot the sequence
figure;
subplot(2,1,1);
stem(length,Signal);
title('Descrete sine for Fs=100 Sine');
xlabel('n');
ylabel('sin[n]');


%Second values
subplot(2,1,2);
f=10;
N=1;
Fs=1000;
[Signal,length]=Sine_Function(f,N,Fs );
subplot(2,1,2);
stem(Signal);
title('Descrete sine for Fs=1000 Sine');
xlabel('n');
ylabel('sin[n]');




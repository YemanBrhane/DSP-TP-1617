close all;
clc;
clear all;

%%  create a signal delta and smooth
X=zeros(1,40);
X(20)=1;
s=0.5;
Ts=1;
alpha=s*Ts;
a=exp(-alpha);

n=1:40;
%Causal part
Ycausal=zeros(1,40);
figure
subplot(3,1,1);
stem(n,X);
title('Input signal')

for i=3:40
   y=2*a*Ycausal(i-1) - a^2*Ycausal(i-2)+X(i)+a*(alpha-1)*X(i-1);
   Ycausal(i)=y;
end

subplot(3,1,2);
stem(n,Ycausal);
title('Causal smoothing')

%Anti Causal part
YantiCausal=zeros(1,40);
for i=1:38
   y=2*a*YantiCausal(i+1) - a^2*YantiCausal(i+2)+X(i)+a*(alpha+1)*X(i+1)-a^2*X(i+2);
   YantiCausal(i)=y;
end
YantiCausal;
subplot(3,1,3);
stem(n,YantiCausal);
title('AntiCausal smoothing')

%% Construct a signal x[k] = u[k -10] ? u[k - 30] and Derivatgive filter

%Causal part
X=zeros(1,40);
X(10:29)=1;
Ycausal=zeros(1,40);

figure
subplot(3,1,1);
stem(n,X)
title('Input signal')

for i=3:40
   y=2*a*Ycausal(i-1)-a^2*Ycausal(i-2)+X(i)- s*a*(alpha)*X(i-1);
   Ycausal(i)=y;
end

subplot(3,1,2)
stem(n,Ycausal);
title('Causal Derivative')

%Anti Causal part
YantiCausal=zeros(1,40);
YantiCausal(10:29)=1;
for i=1:38
   y=2*a*YantiCausal(i+1) - a^2*YantiCausal(i+2) + a*(alpha)*s*X(i+1);
   YantiCausal(i)=y;
end
subplot(3,1,3);
stem(n,YantiCausal);
title('AntiCausal Derivative')

% The causal smoothing and derivative  always give positive while the anti
% causal have negative value. 

% in smoothing the amplitude of of the output signal is smaller than thge input signal while in the derivative they have
%some values larger in value 




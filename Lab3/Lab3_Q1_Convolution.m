% Yeman Brhane 
%MAIA 
%LAB3

function Lab3 ()
close all;
clear all;
clc;
N=5;
x=[1 2 3 4]; % input signal

%1D convolution for diarc filter
figure
h=zeros(1,N); % unit step
h(1)=1;
Y=convFn(x,h);
stem(Y);
ylabel('Y[n]');
xlabel('----->n');
title('Convolution with dirac');


%1D convolution for exponential filter
    h=exp(1:N);
    Y=convFn(x,h);
    figure
    stem(Y);
    ylabel('Y[n]');
    xlabel('----->n');
    title('Convolution with exponential');


%1D convolution for unit step filter
    figure
    h=ones(1,N);
    Y=convFn(x,h);
    stem(Y);
    ylabel('Y[n]');
    xlabel('----->n');
    title('Convolution with step');
    
% h=[-1 1];
    figure
    h=[-1 1];
    Y=convFn(x,h);
    stem(Y);
    ylabel('Y[n]');
    xlabel('----->n');
    title('Convolution with h=[-1 1]');
% Question 1.3
    h=zeros(1,N);
    h(1)=1;
    m=length(x);
    n=length(h);

% Periodic pading
x=[1 2 3 4]; % input signal
figure
h=ones(1,N);
m=length(x);
n=length(h);
X=[x(1:(n-1)),x,x(1:(n-1))]; % I have paded the its first n-1 at begining and ending
Y=convFn_extended(X,h,n,m);
stem(Y);
ylabel('Y[n]');
xlabel('----->n');
title('Convolution with periodic padding');

% constant pading
x=[1 2 3 4]; % input signal
figure
h=ones(1,N);
m=length(x);
n=length(h);
X=[ones(1,(n-1)),x,ones(1,(n-1))]; % I have paded the its first n-1 at begining and ending
Y=convFn_extended(X,h,n,m);
stem(Y);
ylabel('Y[n]');
xlabel('----->n');
title('Convolution with constant padding');

% Symetric pading
x=[1 2 3 4]; % input signal
figure
h=ones(1,N);
m=length(x);
n=length(h);
X_f=flip(x); % this flips x from left to right
X=[X_f(1:(n-1)),x,X_f(1:(n-1))]; % I have paded the its first n-1 at begining and ending
Y=convFn_extended(X,h,n,m);
stem(Y);
ylabel('Y[n]');
xlabel('----->n');
title('Convolution with Symetric pading');

function Y=convFn(x,h)
m=length(x);
n=length(h);
X=[zeros(1,n-1),x,zeros(1,n-1)]; % I have paded length(h)-1 at begining and ending
% the size of the  convolved signal is n+m+1
L=n+m-1;
Y=zeros(1,L);
for i=1:L
for j=1:n
    Y(i)=Y(i)+X(n+i-j)*h(j);
end
end
end

% extended version
function Y=convFn_extended(X,H,n,m)

L=n+m-1;
Y=zeros(1,L);
for i=1:L
for j=1:n
    Y(i)=Y(i)+X(n+i-j)*h(j);
end
end
end
end

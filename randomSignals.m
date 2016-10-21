%% Exercice 2 on Random signals
 
% YEMAN BRHANE
% MAIA STUDENT

clc;
close all;
clear all;


%% 
% 2.1 Generate an observation xn 1000 of the normal/gaussian random process N. Plot the histogram
% of these data as well as the theoretical distribution.
N = 1000; 
X = randn(1,N);
X_mean = mean(X);
x_std = std(X);
[h, xh] = hist(X);
dh = xh(2)-xh(1);
h = h/(sum(h)*dh);
figure(1), plot(xh,h);
x_gaussian = exp(-0.5*((xh-X_mean)/x_std).^2);
x_gaussian = x_gaussian * (1 / (x_std * sqrt(2*pi)));
hold on; 
plot(xh, x_gaussian, 'r--');
hold off; 

 legend('Distribution of data','Theoretical distribution');
    title(['Histogram of Data and Theoretical distribution at N=',num2str(N)]);
    xlabel('x');
    ylabel('y');
%As The number of samples increase the theoretical random process and normal/gausian distribution wiil be same.

%%   2.2 Same question with the uniform law of the random process U and an observation xu.


    N=1000;
    X_u = rand(1,N);
    meanX = mean(X_u);
    stdX = std(X_u);
    [countX, C] = hist(X_u);
    stepX = C(2)-C(1);
    countX = countX/(sum(countX)*stepX);
    
    % Create constant Distribution
    uniformX(1:length(C)) = 1*max(countX); 
    
    % Plot the figure
    figure;
    plot(C, countX, C, uniformX);
    legend('Distribution of data','Theoretical distribution');
    title(['Histogram of Data and Theoretical distribution at N=',num2str(N)]);
    xlabel('x');
    ylabel('y');
    
    
    

%%  Compute the autocorrelation of the Gaussian and Uniform Noices

gaussianX=X;
whiteX=X_u; 
gaussianCorr = xcorr(gaussianX,'biased');
uniformCorr = xcorr(whiteX, 'biased');

% Plot the figure
figure; 
plot(gaussianCorr);
title('White noise');
figure; 
plot(uniformCorr);
title('Not White noise');

%The auto correlation of uniform distribution is white noice, while not in
%Gaussian

%% Compute the crosscorrelation
    % Generate 3 signals
    s1=round(rand(1,50));
    s2=round(rand(1,50));
    s3=round(rand(1,50)); 
    
    % Generate a whole signal s
    s(1:50)=s1;
    s(101:150)=s2;
    s(201:250)=s3;
    
    % Compute the cross-correlation
    s1Corr=xcorr(s,s1); 
    figure;
    plot(s1Corr);
    title('Correlation between S1 and S');
    s2Corr=xcorr(s,s2); 
    figure;
    plot(s2Corr);
    title('Correlation between S2 and S');
    s3Corr=xcorr(s,s3); 
    figure;
    plot(s3Corr);
    title('Correlation between S3 and S');

% Yeman Brhane HAGOs
% MAIA 
%LAB2
function []=Exercise2and3()
N=20;
n=1:N
X=ones(1,N);
X(1:3)=0;
acc=zeros(1,N);
for i=1:N
     acc(i)=sum(X(1:i));
end
 
figure;
stem(n,acc);
title('Accomulator');
xlabel('n');
ylabel('Amplitude')

% the system is not stable since as the input increase the output increses
% Its impulse response is 1

%% 2.2
  x = zeros(1,20);
  x(1)=1;
  S = zeros(1,20);
  for i = 1 : 20   
     S(i) = sum(x(1:i)) ;
  end
  figure(6);
  stem(S);
  title('RESPONSE OF PRIM TO DIRAC FN');
  
  %COMMENT: The system is stable as the grap is constant

%% 2.3
clear all;
 x = zeros(1,10);
  x(1)=1;
   S = zeros(1,10);
   S(1)=1;
  for i = 2 : 10   
      S(i) = x(i) + 2*S(i-1)
  end
  figure(7);
  stem(S);
  title('y(k) = x(k) + 2*y(k+1)')
  
  %COMMENT: As n incrses the value increase twice so the system divergs.
%% 2. 4
clear all;
 x = zeros(1,10);
  x(1)=1;
   S = zeros(1,10);
   S(1)=1;
  for i = 2 : 10   
      S(i) = x(i) + S(i-1)/3;
  end
  figure(7);
  stem(S);
  title('y(k) = x(k) + y(k+1)/3')
  
  %COMMENT: As n incrses the value convergs to zero. the system is
  %convergent
  %%  EXERCISE 3
  % 3.1
  clear all;
  clc;
  xa = [0 0 0 0 1 2 3 4 5 0 0 0 0 0 0 0 0 0 0];
  xb = [0 0 0 0 0 0 0 0 0 4 3 2 1 0 0 0 0 0 0];
  
 for i = 2 : 10  
  ya(i) = 3*xa(i-1) - 2*xa(i) + xa(i+1);
  yb(i) = 3*xb(i-1) - 2*xb(i) + xb(i+1);
  end
  
  figure;
  stem(ya);
  title('y(k) = 3*x(k-1) - 2*x(k) + x(k+1)')
  
  figure;
  stem(ya);
  title('y(k) = 3*x(k-1) - 2*x(k) + x(k+1)')
  
  %3.2
   %A system is called if it satisfays thes conditions
   %.....1. if x[n]->y[n]....ax[n]->ay[n]
   %.....2. (xa[n]+xb[n])->ya[n]+yb[n]
  
  %TO PROVE THE LINEAR PROPERTY, WE WILL MULTIPLY THE SYSTEM WITH A CONSTANT
  %AND OBSERVE THE OUTPUT
  
  for k = 2 : 10  
  y11(k) = 2* (3*xa(k-1) - 2*xa(k) + xa(k+1) );
  end
    
  % From the equation nit is clear that te first condition will be
  % satiffied
 X=xa+xb;
  for k = 2 : 10  
 z(k) =  3*X(k-1) - 2*X(k) + X(k+1);
  end
  
  Linea_Sum = ya + yb;
  
  fprintf('The response of the system to sum of the inputs: \n')
  disp(z);
  
  fprintf('The sum of the outputs when inputs are applied separetly : \n')
  disp(Linea_Sum);
 

  %3.3
  % nonlinear and noninvariant system proposed is:
  % y(n) = n*x(n)^2 + x(n+1)nonlinear because of the second order term x(n)^2
  %it is noninvariant because of the n multiplied by x(x)^2




end


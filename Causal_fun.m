% Yeman Brhane HAGOs
% MAIA 
%LAB2
function  []= Causal_fun()
% define input
N=20;
n=1:N;
In=ones(1,N);
In(1:3)=0;
%non causal output
output=zeros(1,N);
%Causal output
output_2=zeros(1,N);
for i=1:N
  
    if i<N
       m=In(i)+In(i+1);
    else
         m=0;
       
    end  
    output(i)=m/2;

end
figure;
subplot(2,2,1);
stem(n,In)
title('input');
xlabel('n');
ylabel('Amplitude')
% Output
subplot(2,2,2);
stem(n,output)
title('Output');
xlabel('n');
ylabel('Amplitude')

for i=1:N
    if i>1
       m=In(i)+In(i-1);
       output_2(i)=m/2;
    else
         m=In(i);
       output_2(i)=m/2;
    end
end
subplot(2,2,3);
stem(n,output_2)
title('Causal Output');
xlabel('n');
ylabel('Amplitude')
end


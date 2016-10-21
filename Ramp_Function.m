function [ signal] = Ramp_Function(a,n, N )
%close all;
if ~nargin
    n=0;
    N=20;
    a=1;
end
if n>(N-1)
error(' n should be between 1 and N-1' );
end
if n<1
error(' n should be between 1 and N-1' );
end
signal=zeros(1,N);
j=1;
for i=n:N;
signal(i)=j*a;
j=j+1;
end

end


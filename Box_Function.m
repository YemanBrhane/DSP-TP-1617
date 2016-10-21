function [ signal ] = Box_Function(a,n, N )
%close all;
if ~nargin
    n=10;
    N=20;
    a=1;
end
if n>(N-a)
error(' n should be between 1+a and N-a' );
end
if n<(1+a)
error(' n should be between 1+a and N-a' );
end
signal=zeros(1,N);
for i=(n-a):(n+a);
signal(i)=1;
end

end


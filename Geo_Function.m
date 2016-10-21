function [ signal ] = Geo_Function(a,n, N )
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
for i=n:N;
signal(i)=a^i;
end

end


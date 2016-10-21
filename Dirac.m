function [ signal ] = Dirac( n, N )
% the default values of the arguments are 0 and 20
close all;
if ~nargin
    n=0;
    N=20;
end
if n>(N-1)
error(' n should be between 0 and N-1' );
end
signal=zeros(1,N);
signal(n)=1;
end


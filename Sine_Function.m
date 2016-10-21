function [signal,n] = Sine_Function(f,N,Fs )
T=1/f;
Ts=1/Fs;
n=0:Ts:N*T;
signal=sin(2*pi*f*n);
end



% function s = sinus(f, phase_rd, nbPeriod, varargin) %fs or N)
%     Ttotal = nbPeriod/f;
%     if (strcmp(varargin{1},'N'))
%         N = varargin{2};
%         Fs = 1/(Ttotal/N);
%     else
%         Fs = varargin{2}
%         N = round(Ttotal*Fs); % ne tombe pas for�cement sur un entier => N retenu puisque dict� pas Ts
%         disp('Warning: the length of the signal can be different from N*Ts');
%     end
%     Ts = 1/Fs;
%     s = sin(2*pi*f*(0:N-1)*Ts+phase_rd);
% end % function sinus
function [ y ] = windowing( x, L )
% ---------------------------
% Author : smh
% Data   : 2017.02.26
% Description :
%       This function implement the windows function.
% ---------------------------

% Input : x - signal to be decomposed
%         L - number of bandpass filters
% Output : y - windowed signal of x where second index indicates which
%          banpass index

N = length(x);
y = zeros(N, L);

T = N/L;
g = zeros(1, 2*T);

for i=1:2*T
    n = -1*T/2 + i - 1;
    g(i) = meyer(n/T);
end

for j=1:L
    index = 1;
    for k=-1*T/2:1.5*T-1
        in_sig = floor(mod(k+(j+1)*T, N)) + 1;
        y(in_sig, j) = g(index) * x(in_sig);
        index = index + 1;
    end
end

end

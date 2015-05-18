function [F,Y] = timetofreq (T,X)
n = length(X);
ts = T(2)-T(1);
fs = 1/ts;
Y = abs(fftshift(fft(X)))/n;
F = (1:n)*(fs/n);
end
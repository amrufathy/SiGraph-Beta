function [F,Y] = timetofreq (T,X)
n = length(X);
ts = T(2)-T(1);
fs = 1/ts;
Y = abs(fft(X));
% Y = Y(1:n/2);
% F = (1:(n/2))*fs;
F = (1:n)*fs;
end
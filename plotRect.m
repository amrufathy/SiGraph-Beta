function [t,x] = plotRect(t,A,shift,width)
middle = (t(1)+t(end))/2;
start = (middle - (width/2)) + shift;
finish = (middle + (width/2)) + shift;
% x = A * rectangularPulse(start,finish,t);
% x = [zeros(1,(length(t)/4)), A * ones(1,(length(t)/2)), zeros(1,(length(t)/4)), 0];
x = zeros(size(t));
x(find(t>start & t<finish)) = A;
end
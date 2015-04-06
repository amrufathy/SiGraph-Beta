function [t,x] = plotRect(t,A,shift,width)
middle = t((1+end)/2);
shift = shift + abs(t(1));
start = (middle - (width/2)) + shift;
finish = (middle + (width/2)) + shift;
x = A * rectangularPulse(start,finish,t);
end
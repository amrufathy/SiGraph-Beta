function [t,x] = plotRect(t,A,shift,width)
shift = shift + t(1);
start = shift - (width/2);
finish = shift + (width/2);
x = A * rectangularPulse(start,finish,t);
end

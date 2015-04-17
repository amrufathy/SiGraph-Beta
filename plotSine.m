function [t,x] = plotSine(t,A,f,shift)
shift = shift * 3.1415926535897932384626433832795 / 180;
x = A * sin(2*pi*f*t + shift);
end
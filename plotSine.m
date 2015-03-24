function [t,x] = plotSine(t,A,f,shift)
x = A * sin(2*pi*f*t + shift);
end

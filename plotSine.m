function [t,x] = plotSine(t,A,f,shift)
x = A * sin(2*pi*f*t + shift);
% plot(t,x,'LineWidth',3);
end

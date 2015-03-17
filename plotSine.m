function plotSine(t,A,f,shift)
x = A * sin(2*pi*f*t + shift);
plot(t,x);
end

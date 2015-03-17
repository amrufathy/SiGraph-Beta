function plotSine(t,A,f,shift)
figure;
x = A * sin(2*pi*f*t + shift);
plot(t,x);
end

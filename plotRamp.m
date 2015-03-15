function plotRamp(slope, shift)
figure;
t = 0:0.01:5;
x = slope*t + shift;
plot(t,x);
end

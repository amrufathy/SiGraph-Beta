function plotRamp(t,slope,shift)
figure;
x = slope*t + shift;
plot(t,x);
end

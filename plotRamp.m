function plotRamp(slope, shift,ti,step,tf)
figure;
t = ti:step:tf;
x = slope*t + shift;
plot(t,x);
end

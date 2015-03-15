function plotRamp(slope, shift,ti,tstep,tf)
figure;
t = ti:step:tf;
x = slope*t + shift;
plot(t,x);
end

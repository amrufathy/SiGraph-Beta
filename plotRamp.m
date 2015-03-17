function plotRamp(ti,tf,tstep,slope,shift)
figure;
t = ti:tstep:tf;
x = slope*t + shift;
plot(t,x);
end

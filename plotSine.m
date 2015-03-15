function plotSine(ti,tf,tstep,A,f,shift)
figure;
t = ti:tstep:tf;
x = A * sin(2*pi*f*t + shift);
plot(t,x);
end

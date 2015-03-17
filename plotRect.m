function plotRect(t,A,Shift,width)
start = Shift - (width/2);
finish = Shift + (width/2);
x = A * rectangularPulse(start,finish,t);
plot(t,x,'LineWidth',3);
end

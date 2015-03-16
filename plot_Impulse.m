function [] = plot_Impulse(t,loc)
t = loc-10:1:loc+10;
x = zeros(1,21);
x(11) = 1; 
disp(loc);
stem(t, x);


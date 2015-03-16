function [] = plot_Impulse(loc)
t = loc-10:1:loc+10;
t(loc) = 1;
t(find(t<loc)) = 0;
t(find(t>loc)) = 0;
stem(t);

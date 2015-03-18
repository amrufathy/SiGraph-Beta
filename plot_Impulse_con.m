function [] = plot_Impulse_con(t, loc)
x = zeros(size(t));
x(find(t == loc)) = 1;
plot(t,x);
end

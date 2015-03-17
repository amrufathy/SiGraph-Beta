function plot_Impulse(t, loc)
x = zeros(size(t));
disp(find(x == loc));
x(find(t == loc)) = 1;
stem(t,x,'LineWidth',3);
end

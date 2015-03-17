function [] = plot_Impulse(t, loc)
figure;
x = zeros(1, size(t,2));
disp(find(x == loc))
x(find(t == loc)) = 1;
stem(t, x);
end

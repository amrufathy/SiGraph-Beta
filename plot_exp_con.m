function [] = plot_exp_con(t,A, Exp)
figure;
x = A * exp(Exp*t);
plot(t, x);
end

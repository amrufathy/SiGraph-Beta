function plot_exp_con(t,A, Exp)
x = A * exp(Exp*t);
plot(t, x);
end

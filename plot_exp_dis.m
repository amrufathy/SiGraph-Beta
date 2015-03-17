function plot_exp_dis(t, A, Exp)
x = A * exp(Exp*t);
stem(t, x);
end

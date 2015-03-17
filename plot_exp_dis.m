function []= plot_exp_dis(t, A, Exp)
figure;
x = A * exp(Exp*t);
stem(t, x);
end

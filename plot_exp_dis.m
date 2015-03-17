function []= plot_exp_dis(t, Amp, Exp)
figure;
stem(t, Amp*exp(Exp));
end

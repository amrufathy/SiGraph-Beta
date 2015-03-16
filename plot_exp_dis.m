function []= plot_exp_dis(t, Amp, Exp)
stem(t, Amp*exp(Exp));

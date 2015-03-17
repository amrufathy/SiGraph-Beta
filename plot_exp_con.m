function [] = plot_exp_con(t,Amp, Exp)
figure;
plot(t, Amp*exp(Exp));
end

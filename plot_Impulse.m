function [t,x] = plot_Impulse(t, loc)
x = zeros(size(t));
x(find(t == loc)) = 1;
% stem(t,x,'LineWidth',3);
end

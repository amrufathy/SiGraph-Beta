function [t,x] = plotUnitStep(t,A,Shift)
x = zeros(size(t));
x(find(t >= Shift)) = A;
% plot(t,x,'LineWidth',3);
end

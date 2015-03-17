function plotUnitStep(t,A,Shift)
x = zeros(size(t));
disp(find(x < Shift));
x(find(t >= Shift)) = A - 0.01;
plot(t,x,'LineWidth',3);
end

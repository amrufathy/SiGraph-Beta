function [t,x] = plotUnitStep(t,A,shift)
shift = shift + t(1);
x = zeros(size(t));
x(find(t >= shift)) = A;
end

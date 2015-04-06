function [t,x] = plotImpulse(t, shift)
shift = shift + abs(t(1));
x = zeros(size(t));
x(find(t == shift)) = 1;
end
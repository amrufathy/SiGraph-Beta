function [t,x] = plotRect(t,A,shift,width)
middle = (t(1)+t(end))/2;
start = (middle - (width/2)) + shift;
finish = (middle + (width/2)) + shift;
x = zeros(size(t));
x(find(t>start & t<finish)) = A;
end
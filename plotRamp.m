function [t,x] = plotRamp(t,slope,shift)
shift = shift + t(1);
x = slope*t - shift;
end

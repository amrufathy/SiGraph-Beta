function [t,x] = plotRamp(t,slope,shift)
shift = shift + t(1);
if(t(1) >= 0)
    x = slope*t - shift; 
else
    x = slope*t + shift;
end

end
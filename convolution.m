function [t_conv, y_conv]  = convolution(x, t_x, y, t_y)

t_conv = t_x(1)+t_y(1):(t_x(end)-t_x(1))/(length(t_x)-1):t_x(end)+t_y(end);
y_conv = conv(x, y);

end
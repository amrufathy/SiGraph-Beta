function [T5,X5] = convolute(T5,X5,t,x)
if (isempty(T5) && isempty(X5))
    return;
end
    tstep = (T5(end)-T5(1))/(length(T5)-1);
    tstep1 = (T5(end)-T5(1));
    T5 = T5(1)+t(1):tstep:T5(end)+t(end);
    X5 = conv(X5,x);
end
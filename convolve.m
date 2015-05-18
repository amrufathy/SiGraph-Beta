function [ T_out, X_out ] = convolve(t1,x,t2,h,ts)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

startp=t1(1)+t2(1);
endp=t1(end)+t2(end);
X_out=conv(x,h).*ts;
T_out=linspace(startp,endp,length(X_out));
end
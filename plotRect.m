function [t,x] = plotRect(t,A,Shift,width)
start = Shift - (width/2);
finish = Shift + (width/2);
x = [0,ones(1,length(t)-2)*A,0];
end

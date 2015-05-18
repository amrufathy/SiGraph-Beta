function [T_out,X_out] = add(t1,x1,t2,x2,ts)
if(length(t1)==0)
    T_out=t2;
    X_out=x2;
else if(length(t2)==2)
    T_out=t1;
    X_out=x1;
    else
        if(t1(end)<t2(end))
            x1 = [x1 zeroes(length(t2)-length(t1))];
            t1= [t1(1:end-1) t1(end):ts:t2(end)];
        else if(t2(end)<t1(end))
            x2 = [x2 zeroes(length(t1)-length(t2))];
            t2= [t2 t2(end-1):ts:t1(end)];
            end
        end
        if(t1(1) > t2(1))
            x1 = [zeroes(length(t2)-length(t1))];
            t1= [t2(1):ts:t1(1) t1(2:end)];
        else if(t2(1)>t1(1))
                x2 = [zeroes(length(t1)-length(t2)) x2];
            t2= [t1(1):ts:t2(1) t2(2:end)];
            end
        end
        T_out=t1;X_out=x1+x2;
    end
end
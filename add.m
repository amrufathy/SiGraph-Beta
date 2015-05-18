function [T2,X2] = add(T2,X2,t,x)
if (isempty(T2))
    T2 = t;
elseif (length(T2) < length(t))
    diff = length(t) - length(T2);
    new_matrix = zeros(1,diff);
    if (t(1) <= T2(1))
        if (X2(1) ~= x(1))
            X2 = [X2, new_matrix];
        else
            X2 = [new_matrix, X2];
        end
    else
        if (X2(1) ~= x(1))
            X2 = [new_matrix, X2];
        else
            X2 = [X2, new_matrix];
        end
    end
    T2 = t;
elseif (length(T2) > length(t))
    diff = length(T2) - length(t);
    new_matrix = zeros(1,diff);
    if (t(1) <= T2(1))
        if (X2(1) ~= x(1))
            x = [x, new_matrix];
        else
            x = [new_matrix, x];
        end
    else
        if (X2(1) ~= x(1))
            x = [new_matrix, x];
        else
            x = [x, new_matrix];
        end
    end
end
X2 = X2 + x;
end
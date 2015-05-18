function [T4,X4] = multiply(T4,X4,t,x)
if (T4 == 1)
    T4 = t;
elseif (length(T4) < length(t))
    diff = length(t) - length(T4);
    new_matrix = ones(1,diff);
    if (t(1) <= T4(1))
        if (X4(1) ~= x(1))
            X4 = [X4, new_matrix];
        else
            X4 = [new_matrix, X4];
        end
    else
        if (X4(1) ~= x(1))
            X4 = [new_matrix, X4];
        else
            X4 = [X4, new_matrix];
        end
    end
    T4 = t;
elseif (length(T4) > length(t))
    diff = length(T4) - length(t);
    new_matrix = ones(1,diff);
    if (t(1) <= T4(1))
        if (X4(1) ~= x(1))
            x = [x, new_matrix];
        else
            x = [new_matrix, x];
        end
    else
        if (X4(1) ~= x(1))
            x = [new_matrix, x];
        else
            x = [x, new_matrix];
        end
    end
end
X4 = X4 .* x;
end
function [T3,X3] = subtract(T3,X3,t,x)
if (isempty(T3) && (X3==0||isempty(X3)))
    T3 = t;
    X3 = x;
    return;
elseif (length(T3) < length(t))
    diff = length(t) - length(T3);
    new_matrix = zeros(1,diff);
    if (t(1) <= T3(1))
        if (X3(1) ~= x(1))
            X3 = [X3, new_matrix];
        else
            X3 = [new_matrix, X3];
        end
    else
        if (X3(1) ~= x(1))
            X3 = [new_matrix, X3];
        else
            X3 = [X3, new_matrix];
        end
    end
    T3 = t;
elseif (length(T3) > length(t))
    diff = length(T3) - length(t);
    new_matrix = zeros(1,diff);
    if (t(1) <= T3(1))
        if (X3(1) ~= x(1))
            x = [x, new_matrix];
        else
            x = [new_matrix, x];
        end
    else
        if (X3(1) ~= x(1))
            x = [new_matrix, x];
        else
            x = [x, new_matrix];
        end
    end
end
X3 = X3 - x;
end
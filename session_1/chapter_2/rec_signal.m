% tín hiệu chữ nhật

function [t, result] = rec_signal(n0, n1)
    t = n0 - 10: 1: n1 + 10;
    res = zeros(1, length(t));
    for i = 1:length(t)
        if (t(i) >= n0 && t(i) <= n1)
            res(i) = 1;
        end
    end
    result = res;
end
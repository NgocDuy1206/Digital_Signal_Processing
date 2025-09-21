% hàm xung delta

function [t,h] = unit_signal(n, n0)
    t = n0-10: 1: n0 + 10;
    h = zeros(1, length(t));
    for i = 1:1:length(t)
        if (t(i) >= n0)
            h(i) = 1;
        end
    end
end
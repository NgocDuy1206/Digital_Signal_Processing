function [x_out, t_out] = sig_shift(x, t, tau)
t_out = t + tau;
x_out = x;
end

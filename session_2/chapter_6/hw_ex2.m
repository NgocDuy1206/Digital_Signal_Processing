
clc; clear; close all;

[x, fs] = audioread('odonnellyougogirl.wav');

N = length(x);

t = (0: N - 1) / fs;

figure;

plot(t, x);

y = zeros(1, N);

D = 1000; gain = 0.4;
D1 = 2000; gain1 = 0.6;

for i = 1:N
    y(i) = x(i);
    if (i >= D) 
        y(i) = y(i) + gain * y(i - D + 1);
    end
    if (i >= D1)
        y(i) = y(i) + gain1 *y(i - D1 + 1);
    end
end

sound(y);
% bài 2 chương 2

clc; clear; close all;

t = -10:0.01:10;  

figure;

%% 1) sinc(t) = sin(t)/t
sinc_t = zeros(size(t));        % khởi tạo
for i = 1:length(t)
    if t(i) == 0
        sinc_t(i) = 1;          % lim sin(t)/t = 1 tại t=0
    else
        sinc_t(i) = sin(t(i))/t(i);
    end
end

subplot(4,1,1);
plot(t, sinc_t, 'LineWidth', 1.5);
grid on;
title('sinc(t) = sin(t)/t');
xlabel('t'); ylabel('Amplitude');

%% 2) e^{-t}
exp_t = exp(-t);   
subplot(4,1,2);
plot(t, exp_t, 'LineWidth', 1.5);
grid on;
title('e^{-t}');
xlabel('t'); ylabel('Amplitude');

%% 3) Xung chữ nhật tuần hoàn, T=2, A=1, vẽ 10 chu kỳ
T = 2; width = 1;   % xung rộng = 1s, chu kỳ = 2s
t_pulse = -10:0.001:10;
x_pulse = mod(t_pulse, T) < width;

subplot(4,1,3);
plot(t_pulse, x_pulse, 'LineWidth', 1.5);
grid on;
title('Xung chữ nhật tuần hoàn, T=2, A=1');
xlabel('t'); ylabel('Amplitude');
xlim([-10 10]);

%% 4) x(t) = sin(pi*t/3 + pi/4) + 2cos(pi*t/4)
x_t = sin(pi*t/3 + pi/4) + 2*cos(pi*t/4);

subplot(4,1,4);
plot(t, x_t, 'LineWidth', 1.5);
grid on;
title('x(t) = sin(\pi t/3 + \pi/4) + 2cos(\pi t/4)');
xlabel('t'); ylabel('Amplitude');

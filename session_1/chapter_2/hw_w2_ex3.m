
clc; clear; close all;

%% ====== TEST 1: NHÂN HAI TÍN HIỆU LIÊN TỤC ======
t = -5:0.01:5;
x1 = sin(t);                 % tín hiệu 1: sin(t)
x2 = cos(t);                 % tín hiệu 2: cos(t)

[y_cont, t_cont] = sig_mult(x1, t, x2, t);

figure('Name','Nhân hai tín hiệu liên tục');
subplot(3,1,1);
plot(t, x1, 'LineWidth', 1.5);
grid on; title('x1(t) = sin(t)');

subplot(3,1,2);
plot(t, x2, 'LineWidth', 1.5);
grid on; title('x2(t) = cos(t)');

subplot(3,1,3);
plot(t_cont, y_cont, 'LineWidth', 1.5);
grid on; title('y(t) = x1(t) * x2(t)');

%% ====== TEST 2: NHÂN VỚI HẰNG SỐ (LIÊN TỤC) ======
c = 2;  % hằng số
[y_const, t_const] = sig_mult(x1, t, c, []);

figure('Name','Nhân tín hiệu liên tục với hằng số');
subplot(2,1,1);
plot(t, x1, 'LineWidth', 1.5); grid on;
title('x1(t) = sin(t)');
subplot(2,1,2);
plot(t_const, y_const, 'LineWidth', 1.5); grid on;
title(['y(t) = x1(t) * ' num2str(c)]);

%% ====== TEST 3: NHÂN HAI TÍN HIỆU RỜI RẠC ======
n = -5:5;
x3 = (n >= 0);              % step signal u[n]
x4 = 0.9.^n;                % exponential sequence

[y_disc, n_disc] = sig_mult(x3, n, x4, n);

figure('Name','Nhân hai tín hiệu rời rạc');
subplot(3,1,1);
stem(n, x3, 'filled'); grid on; title('x3[n] = u[n]');
subplot(3,1,2);
stem(n, x4, 'filled'); grid on; title('x4[n] = 0.9^n');
subplot(3,1,3);
stem(n_disc, y_disc, 'filled'); grid on;
title('y[n] = x3[n] * x4[n]');

%% ====== TEST 4: NHÂN VỚI HẰNG SỐ (RỜI RẠC) ======
c2 = -3;
[y_disc_const, n_disc_const] = sig_mult(x3, n, c2, []);

figure('Name','Nhân tín hiệu rời rạc với hằng số');
subplot(2,1,1);
stem(n, x3, 'filled'); grid on; title('x3[n] = u[n]');
subplot(2,1,2);
stem(n_disc_const, y_disc_const, 'filled'); grid on;
title(['y[n] = x3[n] * ' num2str(c2)]);

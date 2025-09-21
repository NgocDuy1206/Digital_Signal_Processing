clc; clear; close all;

% ----- LIÊN TỤC -----
t = -5:0.01:5;
x = sin(t);

[xf, tf] = sig_flip(x, t);
[xs, ts] = sig_shift(x, t, 2);
[xc, tc] = sig_scale(x, t, 0.5);

figure;
subplot(3,1,1); plot(t, x, tf, xf); title('Flip');
subplot(3,1,2); plot(t, x, ts, xs); title('Shift +2');
subplot(3,1,3); plot(t, x, tc, xc); title('Scale 0.5');
grid on;

% ----- RỜI RẠC -----
n = -5:5;
x = cos(pi*n/5);

[xf, nf] = sig_flip(x, n);
[xs, ns] = sig_shift(x, n, 2);
[xc, nc] = sig_scale(x, n, 2); % co giãn rời rạc = giãn trục

figure;
subplot(3,1,1); stem(n, x,'filled'); hold on; stem(nf, xf,'filled'); title('Flip'); grid on;
subplot(3,1,2); stem(n, x,'filled'); hold on; stem(ns, xs,'filled'); title('Shift +2'); grid on;
subplot(3,1,3); stem(n, x,'filled'); hold on; stem(nc, xc,'filled'); title('Scale 2'); grid on;

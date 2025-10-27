clc; clear; close all;

fs = 8192;
t = 0:1/fs:3;

% === Tạo 3 tín hiệu riêng ===
x1 = (t >= 0 & t < 0.3).*sin(2*pi*220*t);
x2 = (t >= 0.1 & t < 0.4).*sin(2*pi*300*t);
x3 = (t >= 0.2 & t < 0.5).*sin(2*pi*440*t);

% === Tổng hợp tín hiệu ===
x = x1 + x2 + x3;

% === Thêm nhiễu trắng Gaussian ===
y = x + 0.5*randn(size(t));

% === Vẽ tín hiệu ban đầu và bị nhiễu ===
figure;
subplot(2,1,1);
plot(t, x); title('Tín hiệu gốc (original signal)');
xlabel('Thời gian (s)'); ylabel('Biên độ');
subplot(2,1,2);
plot(t, y); title('Tín hiệu bị nhiễu (noisy signal)');
xlabel('Thời gian (s)'); ylabel('Biên độ');

% === Thiết kế bộ lọc IIR loại bỏ tần số 300Hz ===
n = 4;  % bậc lọc
f1 = 280; f2 = 320; % dải cần triệt
[b, a] = butter(n, [f1 f2]/(fs/2), 'stop'); % bandstop filter

% === Đáp ứng tần số của bộ lọc ===
figure;
freqz(b, a, 1024, fs);
title('Đáp ứng tần số của bộ lọc loại bỏ 300Hz');

% === Lọc tín hiệu ===
y_filtered = filter(b, a, y);

% === So sánh tín hiệu trước và sau khi lọc ===
figure;
subplot(2,1,1);
plot(t, y);
title('Tín hiệu bị nhiễu (Noisy)');
xlabel('Thời gian (s)'); ylabel('Biên độ');

subplot(2,1,2);
plot(t, y_filtered);
title('Tín hiệu sau khi lọc (Filtered)');
xlabel('Thời gian (s)'); ylabel('Biên độ');

% === Phân tích miền tần số ===
N = length(t);
f = (0:N-1)*(fs/N);
Y = abs(fft(y));
Yf = abs(fft(y_filtered));

figure;
subplot(2,1,1);
plot(f(1:N/2), Y(1:N/2));
title('Phổ tín hiệu trước lọc (Before filtering)');
xlabel('Tần số (Hz)'); ylabel('|Y(f)|');

subplot(2,1,2);
plot(f(1:N/2), Yf(1:N/2));
title('Phổ tín hiệu sau lọc (After filtering)');
xlabel('Tần số (Hz)'); ylabel('|Y(f)|');

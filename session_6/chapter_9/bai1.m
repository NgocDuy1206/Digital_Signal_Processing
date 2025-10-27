clc; clear; close all;

fs = 8192;         % Tần số lấy mẫu
fc = 1000;         % Tần số cắt (cutoff frequency)
n = 4;             % Bậc lọc

% === Bộ lọc thông thấp (Low-pass filter) ===
[b_butter, a_butter] = butter(n, fc/(fs/2));
[b_cheby1, a_cheby1] = cheby1(n, 0.5, fc/(fs/2));
[b_cheby2, a_cheby2] = cheby2(n, 20, fc/(fs/2));

% === Đáp ứng biên độ và pha ===
[H_butter, w] = freqz(b_butter, a_butter, 1024, fs);
H_cheby1 = freqz(b_cheby1, a_cheby1, 1024, fs);
H_cheby2 = freqz(b_cheby2, a_cheby2, 1024, fs);

figure;
subplot(2,1,1)
plot(w, 20*log10(abs(H_butter)), 'b', 'LineWidth', 1.5); hold on;
plot(w, 20*log10(abs(H_cheby1)), 'r', 'LineWidth', 1.5);
plot(w, 20*log10(abs(H_cheby2)), 'g', 'LineWidth', 1.5);
grid on;
title('Đáp ứng biên độ (Magnitude Response)');
xlabel('Tần số (Hz)'); ylabel('|H(f)| (dB)');
legend('Butterworth','Chebyshev I','Chebyshev II');

subplot(2,1,2)
plot(w, unwrap(angle(H_butter)), 'b', 'LineWidth', 1.5); hold on;
plot(w, unwrap(angle(H_cheby1)), 'r', 'LineWidth', 1.5);
plot(w, unwrap(angle(H_cheby2)), 'g', 'LineWidth', 1.5);
grid on;
title('Đáp ứng pha (Phase Response)');
xlabel('Tần số (Hz)'); ylabel('Pha (rad)');
legend('Butterworth','Chebyshev I','Chebyshev II');

clc; clear; close all;

% --- Tín hiệu ---
N = 32;                   % Số mẫu (samples)
n = 0:N-1;                % Chỉ số thời gian (time index)
x = 2*cos(pi*n/4 + pi/6); % Tín hiệu

% --- Biến đổi Fourier rời rạc (DFT) ---
X = fft(x, N);            % Tính FFT (Fast Fourier Transform)
magX = abs(X);            % Phổ biên độ (magnitude spectrum)
phaX = angle(X);          % Phổ pha (phase spectrum)

% --- Vẽ phổ ---
k = 0:N-1;                % Chỉ số tần số (frequency index)

figure;
subplot(2,1,1);
stem(k, magX, 'filled');
title('Phổ biên độ (Magnitude Spectrum)');
xlabel('Chỉ số tần số k');
ylabel('|X[k]|');
grid on;

subplot(2,1,2);
stem(k, phaX, 'filled');
title('Phổ pha (Phase Spectrum)');
xlabel('Chỉ số tần số k');
ylabel('Pha (radian)');
grid on;

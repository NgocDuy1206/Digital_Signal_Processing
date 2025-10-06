clear; close all; clc;

f  = 13;    % tần số thật
fs = 10;    % tần số lấy mẫu (giữ nguyên để thấy alias = 3 Hz)

% Tăng số chu kỳ quan sát (ví dụ 50 chu kỳ)
num_cycles = 50;
t1 = 0:1/fs: num_cycles*(1/f);
x1 = sin(2*pi*f*t1);

N = length(x1);
Nfft = 4096;                 % zero-pad để nội suy phổ mượt hơn
X = fft(x1, Nfft);

% Chuẩn hoá đúng và lấy nửa phổ
P2 = abs(X)/N;
P1 = P2(1:Nfft/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f_axis = (0:(Nfft/2))*(fs/Nfft);

figure;
plot(f_axis, P1, 'LineWidth',1.4);
xlim([0 fs/2]);
grid on;
xlabel('Tần số (Hz)'); ylabel('|X(f)|');
title('Phổ biên độ (giữ fs=10, nhiều chu kỳ quan sát)');

clear; close all; clc;

[x, fs] = audioread("audioclip1.wav");

figure;
plot(x);

sound(x);


if size(x,2) > 1
    x = x(:,1);   % Lấy kênh trái
end


N = length(x);
X = fft(x);
f = (0:N-1)*(fs/N);       % Trục tần số

% Chỉ lấy nửa phổ dương
P2 = abs(X/N);
P1 = P2(1:floor(N/2)+1);
P1(2:end-1) = 2*P1(2:end-1);
f_axis = f(1:floor(N/2)+1);

figure;
plot(f_axis, P1);
xlabel('Tần số (Hz)');
ylabel('|X(f)|');
title('Phổ biên độ của tín hiệu âm thanh');
xlim([0 fs/2]);  % chỉ hiển thị đến tần số Nyquist
grid on;

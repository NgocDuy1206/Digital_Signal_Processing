clc; clear; close all;

[x, fs] = audioread('odonnellyougogirl.wav');

% Nếu file là stereo -> chuyển sang mono
if size(x,2) > 1
    x = mean(x, 2);
end
x = x(:);                % đảm bảo dạng cột vector

N = length(x);

% ===== THAM SỐ NGÂN =====
D  = 100;
gain = 0.6;              % 0 < gain < 1 để tiếng ngân giảm dần

% ===== TÍNH THEO y(n) = x(n) + gain * y(n-D) =====
y = zeros(N, 1);         % khởi tạo đầu ra

for n = 1:N
    y(n) = x(n);         % tín hiệu gốc
    if n > D
        y(n) = y(n) + gain * y(n - D);  % feedback từ quá khứ
    end
end

% Chuẩn hóa để tránh clipping
y = y / max(abs(y)+1e-12);

% Phát âm thanh
sound(y, fs);

% Vẽ để quan sát
t = (0:N-1)/fs;
figure;
subplot(2,1,1);
plot(t, x); title('Tín hiệu gốc'); xlim([0 2]); grid on;
subplot(2,1,2);
plot(t, y); title('Tín hiệu có tiếng ngân (feedback echo)'); xlim([0 2]); grid on;
xlabel('Thời gian (s)');
ylabel('Biên độ');

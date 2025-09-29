% cho hệ thống LTI nhân quả mô tả bởi phương trình sai phân:
%     y(n) = 0.3 * y(n - 1) + -0.2 y(n - 5) + x(n) + 3x(n-1) + x(n - 2) -5x(n - 4)
% tính và vẽ đáp ứng hệ thống với -100 <= n <= 100? vẽ gainr đồ điểm cực điểm không của hệ thống
% Có kết luận gì về chúng?
% 2. Xác định đáp ứng đầu ra của hệ thống khi biết tín hiệu vào 
%         x(n) = 5 cos(0.2 * pi * n) * sin(0.4 * pi *n)


a = [1 -0.3 0 0 0 0.2];

b = [1 3 1 0 -5];

n = -100:100;

h = impz(b, a);
N = length(h);


figure;
plot(-N + 1: 0, h);
title('đáp ứng xung h(n)');
grid on;

figure;
zplane(b, a);

x = 5 * cos(0.2 * pi * n) .* sin(0.4 * pi * n);
y = conv(x, h);

figure;

plot(0: length(y) - 1, y);
title('đáp ứng lối ra y(n)');
grid on;

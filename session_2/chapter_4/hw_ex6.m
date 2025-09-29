% -	Đề bài: Cho hệ thống y(n) - 2y(n - 1) + y(n - 2) = x(n) + x(n - 1)
% • Xác định h(n)
% • Hệ thống có ổn định không?
% • Xác định tín hiệu ra khi tín hiệu vào x(n) = u(n)
% • Xác định tín hiệu ra khi x(n) = 2 sin(0.01πn), -200 ≤ n ≤ 200


a = [1 -2 1];
b = [1 1];

h = impz(b, a);

figure;
plot(h); title('đáp ứng xung h(n)');
grid on;

% ta thấy h(n) tăng vô cùng => hệ thống ko ổn định

n = 0: 20;
x = (n >= 0);
h = impz(b, a, length(x));
y = conv(x, h);

figure;
plot(0:length(y) -1, y);
title('đáp ứng lối ra với tín hiệu lối vào x(n) = u(n)');
ylabel('y(n)');
xlabel('n');
grid on;

n = -200: 200;
x = 2 * sin(0.01 * pi * n);
h = impz(b, a, length(x));
y = conv(x, h);

figure;
plot(0:length(y) -1, y);
title('đáp ứng lối ra với tín hiệu lối vào x(n) = 2 sin(0.01πn)');
ylabel('y(n)');
xlabel('n');
grid on;

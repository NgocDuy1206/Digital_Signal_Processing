% -	Đề bài: Cho hệ thống 
% 	y(n) - 0.5y(n - 1) + 0.25y(n - 2) = x(n) + 2x(n - 1) + x(n - 3)
% • Xác định và vẽ đáp ứng xung của hệ thống h(n), 0 ≤ n ≤ 100
% • Hệ thống có ổn định không?
% • Với x(n) = [5 + 3 cos(0.2πn) + 4 sin(0.6πn)]u(n), xác định y(n) với 0 ≤ n ≤ 200

n = 0: 100;
a = [1 -0.5 0.25];
b = [1 2 0 1];

h = impz(b, a, length(n));

figure;
plot(n, h);
title('đáp ứng xung h(n)');
grid on;

n = 0: 200;

x = 5 + 3 * cos(0.2 * pi * n) + 4 * sin(0.6 * pi * n);
h = impz(b, a, length(x));
y = conv(x, h);

figure;
plot(0: length(y) - 1, y);
xlabel('n');
ylabel('y(n)');
grid on;
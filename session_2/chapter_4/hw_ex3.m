% bài 3 chương 4
% Xác định đáp ứng lối ra hệ thống TTBB trong các trường hợp sau:
% • y(n) − 0.5y(n − 1) + 0.25y(n − 2) = x(n) + 2x(n − 1) + x(n − 3), với x(n) =
% cos(n.π/3)u(n), y(-1)=1 và y(-2)=0.5
% • y(n) − 2y(n − 1) + y(n − 2) = x(n) + x(n − 1) với x(n) = u(n), y(-1)=-1 và
% y(-2)=-2

clc; clear; close all;
% • y(n) − 0.5y(n − 1) + 0.25y(n − 2) = x(n) + 2x(n − 1) + x(n − 3), với x(n) =
% cos(n.π/3)u(n), y(-1)=1 và y(-2)=0.5
n = 0: 10;
a = [1 -0.5 0.25];
b = [1 2 0 1];

x = cos(n * pi / 3);

x_past = [0 0 0];
y_past = [1 0.5];

zi = filtic(b, a, y_past, x_past);

y = filter(b, a, x, zi);

figure;
subplot(2,1,1);
plot(n, y, 'LineWidth',1);
grid on;

% • y(n) − 2y(n − 1) + y(n − 2) = x(n) + x(n − 1) với x(n) = u(n), y(-1)=-1 và
% y(-2)=-2

a = [1 -2 1];
b = [1 1];

x = (n >= 0); 

x_past = [0];
y_past = [-1 -2];

zi = filtic(b, a, y_past, x_past);
y = filter(b, a, x, zi);

subplot(2, 1, 2);
plot(n, y, 'LineWidth',1);

% làm cách khác

n = 0: 10;
N = length(n);
x = zeros(1, N);
for i = 1: N
    if (i >= 3)
        x(i) = 1;
    end
end
y = zeros(1, length(x));
y(1) = -2;
y(2) = -1;
for i = 3: 1: length(y)
    y(i) = 2 * y(i - 1) - y(i - 2) + x(i) + x(i - 1);
end

figure;
plot(y);
grid on;






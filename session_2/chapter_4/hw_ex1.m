% bài 1 chương 4
% 
% Đề bài:
% Vẽ đáp ứng lối ra của hệ thống trong các trường hợp sau:
% • x(n) = {−1, −2, 3, 4, 2, 9}; h(n) = {1, 3, 2, 1}
% • x(n) = {1, 2, 3, 4, 5}; h(n) = {6, 7, 8, 9}
% • x(n) = (0.8)nu(n), h(n) = (−0.9)nu(n)
% • x(n) = (1/4)−n[u(n + 1) − u(n − 4)], h(n) = u(n) − u(n − 5)


% • x(n) = {−1, −2, 3, 4, 2, 9}; h(n) = {1, 3, 2, 1}
x = [-1 -2 3 4 2 9];
h = [1 3 2 1];

y = conv(x, h);
figure;
subplot(2,2,1);
stem(y, 'LineWidth', 1);

% • x(n) = {1, 2, 3, 4, 5}; h(n) = {6, 7, 8, 9}
x = [1 2 3 4 5];
h = [6 7 8 9];
y = conv(x, h);

subplot(2,2,2);
stem(y, 'LineWidth', 1);

% tham số chung

n = -10: 10;

% • x(n) = (0.8)^n * u(n), h(n) = (−0.9)^n * u(n)

x = 0.8 .^ n;
h = (-0.9) .^ n;
y = conv(x, h);

subplot(2,2,3);
stem(y, 'LineWidth', 1);

% • x(n) = (1/4)−n[u(n + 1) − u(n − 4)], h(n) = u(n) − u(n − 5)

x = (1/4) .^ (-n) .* (sig_delta(n, -1) - sig_delta(n, 4))
h = sig_delta(n, 0) - sig_delta(n, 5);
y = conv(x, h);
ny = (n(1)+n(1)) : (n(end)+n(end));

% Vẽ
subplot(2,2,4);
stem(ny, y, 'LineWidth', 1.5);
grid on;

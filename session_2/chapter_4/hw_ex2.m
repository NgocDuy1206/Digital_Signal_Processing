% bài 2 chương 4
% đề bài:
% Xác định tính ổn định của các hệ thống sau. Vẽ đồ thị biểu diễn đáp ứng xung.
% Có thể rút ra kết luận gì?
% • h(n) = 3δ(n + 2) + 2δ(n) − δ(n − 3) + 5δ(n − 7), 5 ≤ n ≤ 10
% • h(n) = 10u(n) − 5u(n − 5) − 10u(n − 10) + 5u(n − 15)
% • h(n) = 2sin(0.01πn)cos(0.5πn), −200 ≤ n ≤ 200
% • h(n) = (1/2)n
% • h(n) = 3n


% • h(n) = 3δ(n + 2) + 2δ(n) − δ(n − 3) + 5δ(n − 7), 5 ≤ n ≤ 10
n = 5: 10;
h = 3 * unit_impluse(n, -2) + 2 * unit_impluse(n, 0) - unit_impluse(n, 3) + 5 * unit_impluse(n, 7);

figure;
subplot(3,2,1);
stem(n, h, 'LineWidth',1);

% • h(n) = 10u(n) − 5u(n − 5) − 10u(n − 10) + 5u(n − 15)
n = -5: 1: 20;
h = 10 * sig_delta(n, 0) - 5 * sig_delta(n, 5) - 10 * sig_delta(n, 10) + 5 * sig_delta(n, 15);

subplot(3,2,2);
stem(n, h, 'LineWidth', 1);

%
% • h(n) = 2sin(0.01πn)cos(0.5πn), −200 ≤ n ≤ 200
n = -200: 200;
h = 2 * sin(0.01 * pi * n) .* cos(0.5 * pi * n);
subplot(3,2,3);
stem(n, h, 'LineWidth', 1);

% 
% • h(n) = (1/2)n
n = -10: 10;
h = (1/2).^n;
subplot(3,2,4);
stem(n, h, 'LineWidth', 1);


% • h(n) = 3^n

n = -10: 10;
h = 3.^n;
subplot(3,2,5);
stem(n, h, 'LineWidth', 1);

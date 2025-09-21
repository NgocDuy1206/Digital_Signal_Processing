% bài 1 chương 2

n0 = 1;

[t y] = unit_signal(0, n0);

n1 = 2;
n2 = 4;

[t1 y1] = rec_signal(n1, n2);

figure;

subplot(2,1,1);
stem(t, y, 'filled', 'LineWidth',1);
xlim([min(t) max(t)]);
title('tín hiệu u(n - 3)');
grid on;

subplot(2, 1, 2);
stem(t1, y1, 'filled', 'LineWidth', 1); 
xlim([min(t1) max(t1)]);
title('tín hiệu hình chữ nhật r(n1, n2)');
grid on;


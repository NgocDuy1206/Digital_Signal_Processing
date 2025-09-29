% -	Đề bài: Cho hệ thống TTBB nhân quả có 
% 	y(n)-4y(n-1)+ 3y(n-2) = x(n)+ x(n-1).
% Hãy:
% • Vẽ đáp ứng xung h(n) (so sánh với kết quả tính bằng tay)
% • Vẽ sơ đồ điểm cực, điểm không
% • Hệ thống có ổn định không? Nếu có, xác định đáp ứng tần số và vẽ phổ biên độ của hệ thống
% • Vẽ đáp ứng lối ra nếu tín hiệu lối vào là x(n) = 2^nu(n)
% • Vẽ đáp ứng lối ra nếu tín hiệu lối vào là x(n) = cos(πn/3)u(n)

a = [1 -4 3];
b = [1 1];

h = impz(b, a);

figure;
plot(h); title('đáp ứng xung h(n)');
grid on;

figure;
zplane(b, a);
grid on;

n = 0:20;
x = 2.^n;            % x[n] = 2^n u(n)
h = impz(b,a,length(x));  % đảm bảo h đủ dài
y = conv(x,h);        % đáp ứng lối ra

figure;
plot(0:length(y)-1, y);
title('Đáp ứng với x(n) = 2^n u(n)');
xlabel('n'); ylabel('y[n]');
grid on;

x = cos(pi*n/3);      % cos(π n / 3) u(n)
h = impz(b,a,length(x));
y = conv(x,h);

figure;
plot(0:length(y)-1, y);
title('Đáp ứng với x(n) = cos(π n /3) u(n)');
xlabel('n'); ylabel('y[n]');
grid on;

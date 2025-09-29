% bài 4 chương 4
% Cho hệ thống TTBB nhân quả có H(z) = (z + 2) / (z – 0.5) . Hãy:
% • Vẽ đáp ứng xung h(n) (so sánh với kết quả tính bằng tay)
% • Xác định các vector a, b
% • Vẽ sơ đồ điểm cực, điểm không
% • Hệ thống có ổn định không? Nếu có, xác định đáp ứng tần số và vẽ đáp ứng biên độ của hệ thống
% • Vẽ đáp ứng lối ra nếu tín hiệu lối vào là x(n) = 2 * (0.9)^nu(n)

a = [1 -0.5];
b = [1 2];

h = impz(b, a);

figure;
plot(h); grid on;

figure;
zplane(b, a);grid on;

figure;
freqz(b, a);grid on;

n = 0: 10;
x = 2 * 0.9 .^n;
y = conv(x, h);


figure;
plot(y);grid on;
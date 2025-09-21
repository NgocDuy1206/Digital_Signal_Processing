f = 10
fs = 1000
t = [-0.5: 1/fs : 0.5]

x = sin(2 * pi * f * t)

X = fft(x)
Y = abs(X)
t2 = [-50: 50]
figure;
subplot(2,1,1);
plot(t, x);
subplot(2,1,2);
plot(t, Y);
xlim(t2);
grid on;

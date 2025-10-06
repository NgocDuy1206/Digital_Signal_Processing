Fs = 100; L = 1000;
t = (0:L-1)/Fs;
x = 0.7*sin(2*pi*50*t) + sin(2*pi*120*t);

NFFT = 2048;
X = fft(x, NFFT)/L;
f_axis = Fs/2*linspace(0,1,NFFT/2+1);

figure;
plot(f_axis, 2*abs(X(1:NFFT/2+1)), 'LineWidth',1.5); grid on;
xlabel('Tần số (Hz)'); ylabel('|X(f)|');
title('Phổ biên độ, Fs = 100 Hz');

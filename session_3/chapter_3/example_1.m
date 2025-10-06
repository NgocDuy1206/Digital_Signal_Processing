
close all; clear; clc;
T = 1/1000; % Chia nho t, de ve hinh
L = 1000; % Chieu dai tin hieu // Length of signal ;
t = (0:L-1)*T; % Khoi tao vector thoi gian, L diem, cach nhau T
% Tin hieu x co tan so 50Hz va 120 Hz:
x = 0.7*sin(2*pi*50*t) + sin(2*pi*120*t);
y = x + 2*randn(size(t)); % Bi nhieu
% Tin hieu lay mau:
Fs = 300; % Tan so lay mau // Sampling frequency
T_s = 1/Fs; % Khoang cach 2 mau la T_s
t1 = (0:L-1)*T_s;
x_s = 0.7*sin(2*pi*50*t1) + sin(2*pi*120*t1);
y_s = x_s + 2*randn(size(t1));
%%% Plot signal in time domain:
figure;
subplot(4,2,1);
plot(t(1:50),x(1:50)) ; % chi ve 50 gia tri cho de quan sat
title(' Tin hieu tuong tu x(t)')
xlabel('time');
subplot(4,2,2); plot(t(1:50),y(1:50));
title(' Tin hieu tuong tu, bi nhieu Gauss trang');
xlabel('time');
subplot(4,2,3);
stem(t1(1:50),x_s(1:50)) ; % chi ve 50 gia tri cho de quan sat
title('Tin hieu duoc lay mau x(t)');
xlabel('time');
subplot(4,2,4);stem(t1(1:50),y_s(1:50));
title('Tin hieu duoc lay mau tu tin hieu bi nhieu');
xlabel('time ');


%%% Plot original signal in frequency domain:
X = fft(x,1024)/L;
% ve pho trong khoang [0, 500] Hz
f_axis = 1000/2*linspace(0,1,513);
subplot(4,2,5);
plot(f_axis,2*abs(X(1:512+1))) ; % abs => Pho bien do
title('Pho bien do cua tin hieu x(t)');
xlabel('Frequency (Hz)'); ylabel('|X(f)|');
subplot(4,2,6);
Y = fft(y,1024)/L;
plot(f_axis,2*abs(Y(1:512+1))) ;
title('Pho bien do cua tin hieu y(t)');
xlabel('Frequency (Hz)'); ylabel('|Y(f)|');
%%% Plot signal in frequency domain when Fs = 90
X1 = fft(x_s,1024)/L;
subplot(4,2,7);
% ve pho trong khoang [0, Fs/2] Hz
f_axis1 = Fs/2*linspace(0,1,513);
plot(f_axis1,2*abs(X1(1:513))) ;
title('Pho bien do cua tin hieu xs(t)');
xlabel('Frequency (Hz)'); ylabel('|Xs(f)|');
subplot(4,2,8);
Y1 = fft(y_s,1024)/L;
plot(f_axis1,2*abs(Y1(1:513))) ;
title('Pho bien do cua tin hieu ys(t)');
xlabel('Frequency (Hz)'); ylabel('|Ys(f)|');
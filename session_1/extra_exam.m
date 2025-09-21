clc; clear; close all;

t=10; fs=100;

% Device 1
t1=0:1/fs:t; f1=3;
x1=sin(2*pi*f1*t1);
X1=fft(x1); L1=length(X1);
P1=abs(X1/L1); P1=P1(1:L1/2+1); P1(2:end-1)=2*P1(2:end-1);
h1=fs*(0:(L1/2))/L1;

% Device 2
t2=0.5*t:1/fs:2*t; f2=4; f3=5;
x2=sin(2*pi*f2*t2).*sin(2*pi*f3*t2);
X2=fft(x2); L2=length(X2);
P2=abs(X2/L2); P2=P2(1:L2/2+1); P2(2:end-1)=2*P2(2:end-1);
h2=fs*(0:(L2/2))/L2;

% Device 3
t3=1.5*t:1/fs:3*t; f4=6; f5=7;
x3=sin(2*pi*f4*t3)+sin(2*pi*f5*t3);
X3=fft(x3); L3=length(X3);
P3=abs(X3/L3); P3=P3(1:L3/2+1); P3(2:end-1)=2*P3(2:end-1);
h3=fs*(0:(L3/2))/L3;

figure;
subplot(3,2,1); plot(t1,x1); title('Device 1 - x1(t)');
subplot(3,2,2); stem(t1(1:50),x1(1:50),'filled'); title('Device 1 (50 samples)');
subplot(3,2,3); plot(t2,x2); title('Device 2 - x2(t)');
subplot(3,2,4); stem(t2(1:50),x2(1:50),'filled'); title('Device 2 (50 samples)');
subplot(3,2,5); plot(t3,x3); title('Device 3 - x3(t)');
subplot(3,2,6); stem(t3(1:50),x3(1:50),'filled'); title('Device 3 (50 samples)');

figure;
subplot(3,1,1); plot(h1,P1); title('Spectrum Device 1');
subplot(3,1,2); plot(h2,P2); title('Spectrum Device 2');
subplot(3,1,3); plot(h3,P3); title('Spectrum Device 3');

clc; clear; close all;

Fs=100; Tmax=10; 
t=-Tmax:1/Fs:Tmax;

% x1(t)=sinc(t)=sin(pi*t)/(pi*t)
x1=zeros(size(t));
for k=1:length(t)
    if t(k)==0
        x1(k)=1;
    else
        x1(k)=sin(pi*t(k))/(pi*t(k));
    end
end
N=length(x1); 
X1=fftshift(fft(x1,N)); 
f=(-N/2:N/2-1)*(Fs/N);

figure;
subplot(3,1,1); plot(t,x1,'LineWidth',1.5); grid on; title('x1(t)=sinc(t)');
subplot(3,1,2); plot(f,abs(X1),'LineWidth',1.5); grid on; title('|X1(f)|');
subplot(3,1,3); plot(f,angle(X1),'LineWidth',1.5); grid on; title('∠X1(f)');

% x2(t)=cos(pi*t/3)+2sin(pi*t/4)
x2=cos(pi*t/3)+2*sin(pi*t/4);
X2=fftshift(fft(x2,N));

figure;
subplot(3,1,1); plot(t,x2,'LineWidth',1.5); grid on; title('x2(t)');
subplot(3,1,2); plot(f,abs(X2),'LineWidth',1.5); grid on; title('|X2(f)|');
subplot(3,1,3); plot(f,angle(X2),'LineWidth',1.5); grid on; title('∠X2(f)');

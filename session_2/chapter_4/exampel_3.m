% tính đáp ứng lối ra bằng hàm filter

N=10;
a=[1, -2];
b=[1, -3];
n=0:N;
x= 2.^n; % bo qua gia tri khoi tao x[-1]
x_in= filtic(b,a,1,0); % initial condition: y(-1)=1, x(-1)=0
y1= filter(b,a,x,x_in);
plot(y1);
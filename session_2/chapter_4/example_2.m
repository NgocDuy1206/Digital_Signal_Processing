% example 
% tinh giá trị lối ra

N=10; % tinh 10 gia tri loi ra
y=zeros(1,N+2);
y(1)=1; %them gia tri khoi tao y(-1)
n=0:N;
x= [0 (2).^n]; %them gia tri khoi tao x(-1)=0
for n =2:N+2 % in Matlab: index starts from 1
y(n) = x(n) -3*x(n-1) +2*y(n-1);
end
y(2:end)
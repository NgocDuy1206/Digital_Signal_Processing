% ước lượng số pi

N = 1e6;
count = 0;
x_circle = zeros(1, N);
y_circle = zeros(1, N);
i1 = 1;

x_rectangle = zeros(1, N);
y_rectangle = zeros(1, N);
i2 = 1; 
for i = 1:1:N
    x = rand - 0.5;
    y = rand - 0.5;
    if (x * x + y * y <= 0.5 * 0.5)
        x_circle(i1) = x;
        y_circle(i1) = y;
        i1 = i1 + 1;
        count = count + 1;
    else
        x_rectangle(i2) = x;
        y_rectangle(i2) = y;
        i2 = i2 + 1;
    end
end

number_pi = count / N * 4

r = 0.5
x1 = [-r r r -r -r];
y1 = [r r -r -r r];

figure;

% vẽ hình chữ nhật
plot(x1, y1, 'r');
hold on;
% vẽ điểm hình chữ nhật
plot(x_rectangle, y_rectangle, 'r.');
hold on;

plot(x_circle, y_circle, 'g.');
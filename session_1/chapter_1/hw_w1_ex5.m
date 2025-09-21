function hw_w1_ex5()
    x1 = [-10: 10]
    x2 = [-2: 2]
    x3 = [-10: 10]
    y1 = x1 .^ 2
    y2 = sin(0.2 * pi * x2)
    y3 = exp(x3)
    
    figure;
    subplot(3, 1, 1);
    plot(x1, y1, 'r-', 'LineWidth', 2); title('hình 1');
    subplot(3, 1, 2);
    plot(x2, y2, '--', 'LineWidth', 2);  title('hình 2');
    subplot(3, 1, 3);
    plot(x3, y3, 'g-.', 'LineWidth', 2);  title('hình 3');
end
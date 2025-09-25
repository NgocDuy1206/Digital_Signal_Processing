% Sử dụng Matlab/simulink thực hiện hiệu ứng tiếng vọng như mô tả trong
% hình 6.2.
% • Đọc file âm thanh bằng lệnh: Có thể lấy file âm thanh ở đây odonnellyougogirl.wav)
% [x, fs]=wavread(’odonnellyougogirl.wav’) hoặc
% 60 Signal and System Lab, UET-VNUHướng dẫn thực hành Xử lý tín hiệu số
% [x, fs]=audioread(’odonnellyougogirl.wav.wav’) [tuỳ theo version Matlab]
% và kiểm tra giá trị tần số lấy mẫu fs của nó bằng bao nhiêu?
% • Dùng lệnh sound để nghe file âm thanh trên.
% • Cấu trúc trên dùng bộ trễ z−4000. Vậy tín hiệu phản xạ bị trễ so với tín hiệu
% gốc bao nhiêu?
% • Thực hiện trên code Matlab sử dụng mối quan hệ: y(n) = x(n) + alpha ∗
% x(n − D), tính lối ra tại thời điểm n, alpha là hệ số suy hao, và D là độ trễ.
% • Thực hiện lại trên Simulink và nghe thử âm thanh thu được.
% • Thay đổi giá trị của khối delay, nghe thử âm thanh lối ra.
% • Hoàn thiện mô hình hiệu ứng echo với nhiều đường phản hồi hơn. Dựa
% trên bảng tham số ở bên dưới, thiết kế mô hình echo2 tương ứng. Ghi lại
% kết quả và trình bày trong báo cáo kết quả như trên hình 6.3. Xác định
% hàm truyền H(z) của hệ thống. Hệ thống có đáp ứng xung hữu hạn hay
% vô hạn. Tính lại đáp ứng lối ra với hàm truyền trên. Nghe thử âm thanh
% thu được.
% Hình 6.3: Bảng giá trị sử dụng thiết kế bộ echo effect đa đường phản xạ
% • Thử thu âm thanh lối vào dùng mic và hàm audiorecorder và nghe thử âm
% thanh có echo tương ứng.

[x, fs] = audioread('odonnellyougogirl.wav');  % đọc file âm thanh

N = length(x);             % số mẫu
t = (0:N-1)/fs;            % vector thời gian

D1 = 1000; alpha1 = 0.6;
D2 = 2000; alpha2 = 0.4;

y = zeros(size(x));
for n = 1:length(x)
    y(n) = x(n);
    if n > D1
        y(n) = y(n) + alpha1 * x(n-D1);
    end
    if n > D2
        y(n) = y(n) + alpha2 * x(n-D2);
    end
end
player1 = audioplayer(x, fs);
playblocking(player1);   % MATLAB chờ x phát xong

player2 = audioplayer(y, fs);
playblocking(player2); 
figure;
subplot(2,1,1);
plot(t, x);
subplot(2,1,2);
plot(t, y);
xlabel('Thời gian (s)');
ylabel('Biên độ');
title('Tín hiệu âm thanh');
grid on;





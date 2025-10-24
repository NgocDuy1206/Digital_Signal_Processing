% record_myvoice.m
fs = 8000;        % sampling rate 8 kHz
nBits = 8;       % bit depth
nChannels = 1;    % mono
duration = 5;     % seconds

fprintf('Sẽ bắt đầu ghi âm trong 1 giây. Chuẩn bị micro...\n');
pause(1);

recObj = audiorecorder(fs, nBits, nChannels);
fprintf('Bắt đầu ghi %d giây (fs = %d Hz)...\n', duration, fs);
recordblocking(recObj, duration);
fprintf('Ghi âm xong.\n');

% Lấy dữ liệu âm thanh
y = getaudiodata(recObj);   % dạng double, giá trị trong [-1, 1]

% Nghe lại
fprintf('Nghe lại file vừa ghi...\n');
sound(y, fs);
% nếu muốn dùng audioplayer (cho phép stop/pause):
% player = audioplayer(y, fs); playblocking(player);

% Vẽ tín hiệu trong miền thời gian
t = (0:length(y)-1) / fs;
figure;
plot(t, y);
xlabel('Thời gian (s)');
ylabel('Biên độ');
title('Tín hiệu giọng nói - miền thời gian');
grid on;
xlim([0, duration]);

% Lưu file WAV
outfilename = 'myvoice1.wav';
audiowrite(outfilename, y, fs);
fprintf('Đã lưu file: %s (thư mục hiện tại: %s)\n', outfilename, pwd);

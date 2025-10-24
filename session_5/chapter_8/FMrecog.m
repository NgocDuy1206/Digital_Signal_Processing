function gender = FMrecog(filespeech)
    % Đọc file âm thanh
[x, fs] = audioread(filespeech);

% Chuyển sang mono nếu là stereo
if size(x,2) > 1
    x = mean(x,2);
end

% Cấu hình STFT
win = hamming(round(0.03*fs));  % cửa sổ 30 ms
overlap = round(0.02*fs);       % overlap 20ms
nfft = 2048;

% Tính STFT
[S, F, T] = stft(x, fs, 'Window', win, 'OverlapLength', overlap, 'FFTLength', nfft);

% Tính phổ biên độ
magS = abs(S);

% Vùng tìm pitch: từ 50–300 Hz
f_min = 50;
f_max = 300;
idx = F >= f_min & F <= f_max;

% Tìm tần số có năng lượng max theo thời gian
[~, maxIdx] = max(magS(idx,:), [], 1);
pitch_freqs = F(idx);
pitch_est = pitch_freqs(maxIdx);

% Loại các giá trị pitch bất thường
pitch_est = pitch_est(pitch_est > 50 & pitch_est < 300);

% Tính pitch trung bình
avg_pitch = mean(pitch_est);

disp(['Pitch trung bình: ', num2str(avg_pitch), ' Hz']);

% Ngưỡng xác định giới tính (giá trị tham khảo)
if avg_pitch < 145
    gender = 'Male';
else
    gender = 'Female';
end

disp(['Gender: ', gender]);

end

[x, fs] = audioread('start.au'); % đọc tín hiệu
x = x(:,1); % nếu stereo → lấy 1 kênh

t = (0:length(x)-1)/fs;

figure;
plot(t, x);
xlabel('Time (s)');
ylabel('Amplitude');
title('Waveform of start.au');
grid on;


start_voice = fs * 0.425;
end_voice = fs * 0.6565;
sound(x(start_voice: end_voice), fs);
pause(1.2);
start_unvoice = fs * 0.22;
end_unvoice = fs * 0.35;
sound(x(start_unvoice: end_unvoice), fs);



[y, fs] = audioread("myvoice1.wav");
sound(y, fs);

t = (0: (length(y) - 1)) / fs;
plot(t, y);
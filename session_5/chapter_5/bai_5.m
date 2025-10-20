% sử dụng hệ thống a2,b2 từ run_examples.m
[b02, B2, A2] = Cautrucnoitiep(b2, a2); % cascade sections
[Tuso2, Mauso2] = cautrucsongsong(a2, b2); % parallel sections

% Kiểm tra đồ thị tần số
H_orig = tf(b2, a2, -1);
H_cascade = tf(1,1,-1);
for k=1:size(B2,1)
    Hc = tf(B2(k,:), A2(k,:), -1);
    H_cascade = series(H_cascade, Hc);
end
H_par = 0;
for k=1:size(Tuso2,1)
    H_par = H_par + tf(Tuso2(k,:), Mauso2(k,:), -1);
end

% Compare:
figure; bode(H_orig, H_cascade, H_par); legend('original','cascade','parallel');

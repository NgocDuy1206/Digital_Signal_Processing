% RUN_EXAMPLES Demo áp dụng Cautrucnoitiep cho 2 ví dụ

% Ví dụ 1
a1 = [1 -2 4 -3];
b1 = [1 5 -4 2];
[b01, B1, A1] = Cautrucnoitiep(b1, a1);
disp('Example 1:')
disp('b0 ='), disp(b01)
disp('B (sections numerator):'), disp(B1)
disp('A (sections denominator):'), disp(A1)

% Ví dụ 2
a2 = [16 12 2 -4 -1];
b2 = [1 -3 11 -27 18];
[b02, B2, A2] = Cautrucnoitiep(b2, a2);
disp('Example 2:')
disp('b0 ='), disp(b02)
disp('B (sections numerator):'), disp(B2)
disp('A (sections denominator):'), disp(A2)

% Kiểm tra tái tạo H(z)
% rebuild numerator and denominator from sections:
rebuild_num1 = b01;
rebuild_den1 = 1;
for k=1:size(B1,1)
    rebuild_num1 = conv(rebuild_num1, B1(k,:));
    rebuild_den1 = conv(rebuild_den1, A1(k,:));
end
% scale original to comparable:
% original b1(1) may differ by scale; compare polynomials up to scale
fprintf('Example1: normalized difference (should be ~0):\n')
norm(polyderiv_diff(b1, rebuild_num1)) % helper below

% helper local function (or create separate function file)
function d = polyderiv_diff(p, q)
    % make lengths equal
    lp = length(p); lq = length(q);
    if lp < lq; p = [zeros(1, lq-lp), p]; end
    if lq < lp; q = [zeros(1, lp-lq), q]; end
    d = norm(p - q);
end

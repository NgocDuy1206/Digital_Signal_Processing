function [Tuso, Mauso] = cautrucsongsong(a, b)
% CAUTRUCSONGSONG Phân rã H(z)=B(z)/A(z) thành cấu trúc song song
% [Tuso, Mauso] = cautrucsongsong(a, b)
% Trả về Tuso, Mauso là các ma trận kx3 tương tự đã định nghĩa
%
% Ý tưởng: dùng residuez để lấy phần dư r, cực p và phần đa thức dư k,
% gom các cực phức liên hợp thành bậc 2 với tử số thực.

    % đảm bảo hàng
    b = b(:).';
    a = a(:).';
    if a(1)==0, error('a(1)=0 không hợp lệ'); end

    % chuẩn hoá
    b = b / a(1);
    a = a / a(1);

    [r, p, k] = residuez(b, a); % r: residues, p: poles, k: direct terms

    tol = 1e-8;
    used = false(size(p));
    Ts = {};
    Ms = {};

    for i=1:length(p)
        if used(i), continue; end
        pi = p(i);
        if abs(imag(pi)) < tol
            % đơn cực thực: r_i/(1 - p_i z^-1)
            % tương ứng tử số B(z) = r_i (1) + 0 z^-1 + 0 z^-2 (we store as [r 0 0])
            Ts{end+1} = [r(i), 0, 0];
            Ms{end+1} = [1, -pi, 0];
            used(i)=true;
        else
            j = find(~used & abs(p - conj(pi)) < tol,1);
            if isempty(j)
                Ts{end+1} = [r(i), 0, 0];
                Ms{end+1} = [1, -pi, 0];
                used(i)=true;
            else
                % cặp phức: tổng  r_i/(1-p_i z^-1) + r_j/(1-p_j z^-1)
                r1 = r(i); r2 = r(j);
                % tổng tử số thành đa thức 2 bậc (real):
                % compute real coefficients for numerator B0 + B1 z^-1 + B2 z^-2
                % Using partial fraction algebra: combine fractions to get: 
                % Num(z) = r1*(1 - p_j z^-1) + r2*(1 - p_i z^-1)
                % when denominator = (1 - p_i z^-1)(1 - p_j z^-1) = 1 - (p_i+p_j) z^-1 + p_i p_j z^-2
                B0 = r1 + r2;
                B1 = - (r1*p(j) + r2*p(i)); % but p(j)=conj(p(i))
                B2 = 0; % actually combination yields degree 1 numerator; but we compute real form:
                % For stability, we convert to real coefficients explicitly by converting r1,r2 pair
                % Use real-imag decomposition:
                % Let p = alpha + j beta, r = u + j v
                alpha = real(pi); beta = imag(pi);
                u = real(r1); v = imag(r1);
                % Derived real numerator coefficients (for denominator 1 - 2alpha z^-1 + (alpha^2+beta^2) z^-2)
                b0_real = 2*u;
                b1_real = -2*(u*alpha - v*beta);
                % collect
                Ts{end+1} = [b0_real, b1_real, 0];
                Ms{end+1} = [1, -2*alpha, alpha^2 + beta^2];
                used([i j]) = true;
            end
        end
    end

    % direct term k (polynomial part)
    if ~isempty(k)
        % k may be vector of length m: each coefficient corresponds to z^0, z^1, ...
        for ii=1:length(k)
            Ts{end+1} = [k(ii), 0, 0];
            Ms{end+1} = [1, 0, 0];
        end
    end

    if isempty(Ts)
        Tuso = zeros(0,3); Mauso = zeros(0,3);
    else
        Tuso = vertcat(Ts{:});
        Mauso = vertcat(Ms{:});
    end
end

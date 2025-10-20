function [b0, B] = Phantichdathuc(b)
% PHANTICHDATHUC  Phân tích đa thức b(x) thành tích các đa thức bậc 2 (hệ số thực)
%   [b0, B] = Phantichdathuc(b)
%   b : vector hệ số [b_n b_{n-1} ... b_0]
%   b0: hệ số khuếch đại ban đầu (b(1))
%   B : ma trận k x 3; mỗi hàng là [1 b1 b2] tương ứng đa thức
%       1 + b1*x + b2*x^2 (ở đây x tương ứng z^{-1} hoặc x tùy ý)
%
% Ghi chú: để nhất quán, nếu một nhân tử là bậc 1 (x - r),
%       ta dùng biểu diễn [1 a1 0] với a1 = -r.

    % ensure row vector
    b = b(:).';
    if isempty(b)
        error('Vector b rỗng');
    end

    b0 = b(1);        % hệ số đầu
    bnorm = b / b0;   % chuẩn hoá để hệ số đầu = 1

    r = roots(bnorm); % nghiệm
    used = false(size(r));
    parts = {};       % cell of rows [1 a1 a2]

    tol = 1e-8;
    for i = 1:length(r)
        if used(i), continue; end
        ri = r(i);
        if abs(imag(ri)) < tol   % thực
            % (x - r) => coef dạng [1, -r, 0]
            parts{end+1,1} = [1, -real(ri), 0];
            used(i) = true;
        else
            % tìm cặp liên hợp
            conjRoot = conj(ri);
            j = find(~used & abs(r - conjRoot) < tol, 1);
            if isempty(j)
                % không tìm thấy (do sai số) - vẫn xử lý là bậc 1
                parts{end+1,1} = [1, -ri, 0]; %#ok<AGROW>
                used(i)=true;
            else
                % tạo đa thức bậc 2: (x - r)(x - r*) = x^2 - 2Re(r)x + |r|^2
                a1 = -2*real(ri);
                a2 = abs(ri)^2;
                parts{end+1,1} = [1, a1, a2];
                used([i j]) = true;
            end
        end
    end

    % convert to matrix kx3: use vertcat
    if isempty(parts)
        B = zeros(0,3);
    else
        B = vertcat(parts{:});
    end
end

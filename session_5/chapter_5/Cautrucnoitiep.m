function [b0, B, A] = Cautrucnoitiep(b, a)
% CAUTRUCNOITIEP  Tách H(z)=B(z)/A(z) thành tích các phần tử bậc <=2
% [b0, B, A] = Cautrucnoitiep(b, a)
% b, a : vector hệ số tử và mẫu (có thể chưa chuẩn hoá a(1)~=1)
% b0 : hệ số khuếch đại (b(1)/a(1))
% B, A: ma trận nsec x 3; hàng k là hệ số tử và mẫu của section k
%      (B(k,:) tương ứng B0 + B1 z^-1 + B2 z^-2; A tương tự)

    % làm hàng
    b = b(:).';
    a = a(:).';
    if a(1)==0
        error('Hệ số a(1) = 0 không hợp lệ');
    end

    b0 = b(1)/a(1);

    % chuẩn hoá để tìm cực (roots) đúng
    bnorm = b / b(1);
    anorm = a / a(1);

    % phân tích tử và mẫu thành nhân tử bậc <=2
    [~, Bparts] = Phantichdathuc(b); % trả về B parts của tử (b0 internal)
    % Phantichdathuc trả B với mỗi hàng [1 a1 a2] tương ứng đa thức bậc <=2
    % Tuy nhiên Phantichdathuc dùng hệ biến x; chúng ta dùng cùng convention.

    % nhưng Phantichdathuc dùng b0; để dễ dàng, ta gọi lại dùng nội bộ:
    rb = roots(bnorm);
    ra = roots(anorm);

    Bparts = groupRootsToSections(rb);
    Aparts = groupRootsToSections(ra);

    % Đảm bảo cùng số section: điền phần tử trung tính [1 0 0]
    nsec = max(size(Bparts,1), size(Aparts,1));
    if size(Bparts,1) < nsec
        Bparts = [Bparts; repmat([1 0 0], nsec - size(Bparts,1), 1)];
    end
    if size(Aparts,1) < nsec
        Aparts = [Aparts; repmat([1 0 0], nsec - size(Aparts,1), 1)];
    end

    B = Bparts;
    A = Aparts;
end

function S = groupRootsToSections(r)
% Trả về ma trận kx3, mỗi hàng [1 a1 a2] cho nhân tử bậc 2 (hoặc 1 với a2=0)
    tol = 1e-8;
    r = r(:).';
    used = false(size(r));
    parts = {};
    for i=1:length(r)
        if used(i), continue; end
        ri = r(i);
        if abs(imag(ri)) < tol
            parts{end+1,1} = [1, -real(ri), 0]; used(i)=true;
        else
            j = find(~used & abs(r - conj(ri)) < tol, 1);
            if isempty(j)
                parts{end+1,1} = [1, -ri, 0]; used(i)=true;
            else
                a1 = -2*real(ri);
                a2 = abs(ri)^2;
                parts{end+1,1} = [1, a1, a2];
                used([i j]) = true;
            end
        end
    end
    if isempty(parts)
        S = zeros(0,3);
    else
        S = vertcat(parts{:});
    end
end

function [y, t_out] = sig_mult(x1, t1, x2, t2)
% sig_mult  - Hàm nhân tín hiệu (liên tục hoặc rời rạc)
%
% [y, t_out] = sig_mult(x1, t1, x2, t2)
%
% INPUT:
%   x1, t1 : tín hiệu 1 và trục thời gian
%   x2, t2 : tín hiệu 2 hoặc hằng số, và trục thời gian (nếu là hằng số thì t2 = [])
%
% OUTPUT:
%   y     : tín hiệu kết quả
%   t_out : trục thời gian chung
%
% Nếu x2 là một hằng số, hàm trả về y = x1 * x2.
% Nếu x2 là một vector, hàm sẽ tìm giao nhau của t1 và t2 để nhân tương ứng.

    % Kiểm tra x2 là hằng số hay vector
    if isscalar(x2)
        % Nhân với hằng số
        y = x1 * x2;
        t_out = t1;
    else
        % Cần lấy phần giao nhau của hai tín hiệu
        [t_out, ia, ib] = intersect(t1, t2);
        x1_sync = x1(ia);
        x2_sync = x2(ib);
        y = x1_sync .* x2_sync;  % nhân từng phần tử
    end

    % Vẽ kết quả để minh họa
    figure;
    subplot(3,1,1);
    stem_or_plot(t1, x1); title('Tín hiệu x1(t)');
    subplot(3,1,2);
    if isscalar(x2)
        stem_or_plot(t1, x1 * 0 + x2); title(['Hằng số = ' num2str(x2)]);
    else
        stem_or_plot(t2, x2); title('Tín hiệu x2(t)');
    end
    subplot(3,1,3);
    stem_or_plot(t_out, y); title('Kết quả nhân y(t)');

end

function stem_or_plot(t, x)
    % Helper để vẽ tự động: nếu t là số nguyên -> stem (rời rạc), ngược lại -> plot
    if all(mod(t,1)==0)
        stem(t, x, 'filled'); grid on;
    else
        plot(t, x, 'LineWidth', 1.5); grid on;
    end
end

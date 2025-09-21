%% hw_w1_ex4

function [min, max] = findMinMax(matrix) 
    [row, column] = size(matrix);
    min_value = matrix(1,1);
    max_value = matrix(1,1);
    for i = 1:1:row
        for j = 1: 1: column
            tmp = matrix(i, j);
            if (tmp > max_value) 
                max_value = tmp;
            end
            if (tmp < min_value) 
                min_value = tmp;
            end
        end
    end
    min = min_value
    max = max_value
end
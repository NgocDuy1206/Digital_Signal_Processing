matrix = zeros(10, 10)

for i = 1:1:10
    for j = 1:1:10
        if (i == j)
            continue
        end
        matrix(i, j) = randi([1 10])
    end
end
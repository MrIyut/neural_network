function [decoded_path] = decode_path(path, lines, cols)
    decoded_path = zeros(rows(path), 2);
    for i = 1:rows(path)
        path(i)
        row = floor((path(i) - 1) / cols) + 1
        col = path(i) - (row - 1) * cols
        if row <= lines && col <= cols
            decoded_path(i, :) = [row col];
        else
            decoded_path = decoded_path(1: end - 1, :);
            a = 0
        endif
    endfor
endfunction

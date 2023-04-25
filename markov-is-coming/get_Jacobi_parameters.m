function [G, c] = get_Jacobi_parameters(link_matrix)
    [row col] = size(link_matrix);
    G = link_matrix(1:(row - 2), 1:(col - 2));
    c = link_matrix(1:(row - 2), col - 1);
endfunction

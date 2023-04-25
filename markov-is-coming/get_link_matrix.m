function link_matrix = get_link_matrix(labyrinth)
    link_matrix = get_adjacency_matrix(labyrinth);
    possibilities = sparse(1 ./ sum(link_matrix~=0, 2));
    [i j] = find(link_matrix);
    for parser = 1:rows(i)
        link_matrix(i(parser), j(parser)) = possibilities(i(parser));
    endfor
endfunction

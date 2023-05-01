function adjacency_matrix = get_adjacency_matrix(labyrinth)
    labRows = rows(labyrinth);
    labCols = columns(labyrinth);
    adjacency_matrix = sparse(labRows * labCols + 2, labRows * labCols + 2);

    lookupBits = 4:-1:1;
    winCol = labRows * labCols + 1;
    loseCol = winCol + 1;
    adjacency_matrix(winCol, winCol) = 1;
    adjacency_matrix(loseCol, loseCol) = 1;
    for row = 1:labRows
      for col = 1:labCols
        state = (row - 1) * labCols + col;
        bits = bitget(labyrinth(row, col), lookupBits);
        if bits(4) == 0 % west
            if col == 1 % lose state to the left
                adjacency_matrix(state, loseCol) = 1;
            else
                adjacency_matrix(state, state - 1) = 1;
            endif
        endif

        if bits(3) == 0 % east
            if col == labCols % lose state to the right
                adjacency_matrix(state, loseCol) = 1;
            else
                adjacency_matrix(state, state + 1) = 1;
            endif
        endif

        if bits(2) == 0 % south
            if row == labRows % win state downwards
                adjacency_matrix(state, winCol) = 1;
            else
                adjacency_matrix(state, state + labCols) = 1;
            endif
        endif

        if bits(1) == 0 % north
            if row == 1 % win state upwards
                adjacency_matrix(state, winCol) = 1;
            else
                adjacency_matrix(state, state - labCols) = 1;
            endif
        endif

      endfor
    endfor
endfunction

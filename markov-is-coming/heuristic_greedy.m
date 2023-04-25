function [path] = heuristic_greedy(start_position, probabilities, adjacency_matrix)
    winCol = columns(adjacency_matrix) - 1;
    path = [];
    path = [path; start_position];
    visited = zeros(rows(probabilities), 1);
    visited(start_position) = 1;
    while rows(path) > 0
        position = path(rows(path));
        if adjacency_matrix(position, winCol) == 1
            path = [path; winCol];
            return;
        endif
        unvisitedNeighbour = 0;
        range = find(adjacency_matrix(position, :));
        for neighbour = range
          if visited(neighbour) == 1
            continue;
          endif
          if unvisitedNeighbour == 0
            unvisitedNeighbour = neighbour;
          else
            if probabilities(neighbour) > probabilities(unvisitedNeighbour)
              unvisitedNeighbour = neighbour;
            endif
          endif
       
        endfor
        if unvisitedNeighbour == 0
           path = path(1: (rows(path) - 1));
           continue;
        endif

        visited(unvisitedNeighbour) = 1;
        path = [path; unvisitedNeighbour];
    endwhile
endfunction

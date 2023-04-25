function [x, err, steps] = perform_iterative(G, c, x0, tol, max_steps)
    unknowns = rows(c);
    zeroMat = zeros(unknowns, 1);
    x = sparse(zeroMat);
    x0 = sparse(x0);
    steps = 0;
    ray = floor(max(abs(svds(G, 1))));
    if ray > 1
        err = 1;
        return;
    end    
    err = 0;

    for steps = 1:max_steps
        x = c + G * x0;
        err = norm(x - x0);
        if err < tol
            break;
        endif
        x0 = x;
    endfor
    x = full(x);
endfunction

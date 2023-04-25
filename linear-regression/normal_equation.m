function [Theta] = normal_equation(FeaturesMatrix, Y, tol, iter)
    A = FeaturesMatrix' * FeaturesMatrix;
    b = FeaturesMatrix' * Y;

    iter += 1;
    Theta = zeros(columns(A), 1);
    if ~(rows(A) == columns(A))
      Theta = [0; Theta];
      return
    endif
    if ~all(eig(A) > 0)
      Theta = [0; Theta];
      return
    endif

    tolSquared = tol * tol;
    r = b - A * Theta;
    v = r;
    k = 1;
    while (k <= iter) && (r' * r > tolSquared)
      t =  (r' * r) / (v' * A * v);
      Theta = Theta + t * v;
      oldR = r;
      r = oldR - t * A * v;
      s = (r' * r) / (oldR' * oldR);
      oldV = v;
      v = r + s * oldV;
      k = k + 1;
    endwhile

    Theta = [0; Theta];
endfunction

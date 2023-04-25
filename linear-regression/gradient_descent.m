function [Theta] = gradient_descent(FeatureMatrix, Y, features, entries, alpha, iter)
    Theta = zeros(features, 1);
    for iteration = 1:iter
      gradient = FeatureMatrix * Theta - Y;
      gradient = sum(gradient .* FeatureMatrix);
      Theta = Theta - alpha * (1 / entries) * gradient';
    endfor
    Theta = [0; Theta];
endfunction

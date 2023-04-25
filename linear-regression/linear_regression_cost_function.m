function [cost] = linear_regression_cost_function(Theta, Y, FeatureMatrix)
    inputs = rows(Y);
    Theta = Theta(2 : end, :);
    cost = 0;
    for i = 1:inputs
      cost = cost + (FeatureMatrix(i, :) * Theta - Y(i)) ^ 2;
    endfor
    cost = cost / (2 * inputs);
endfunction

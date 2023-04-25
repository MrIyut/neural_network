function [cost] = ridge_regression_cost_function(Theta, Y, FeMatrix, lambda)
    cost = linear_regression_cost_function(Theta, Y, FeMatrix) + lambda * sum(Theta .* Theta);
endfunction

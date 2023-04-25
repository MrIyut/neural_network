function [cost] = lasso_regression_cost_function(Theta, Y, FeMatrix, lambda)
    cost = 2 * linear_regression_cost_function(Theta, Y, FeMatrix) + lambda * norm(Theta, 1);
endfunction

function [J, grad] = cost_function(params, X, y, lambda, input_layer_size, hidden_layer_size, output_layer_size)
    [theta1, theta2] = separate_weights(params, input_layer_size, hidden_layer_size, output_layer_size);
    m = rows(X);

    identity = eye(output_layer_size);
    Yexpanded(:, :) = identity(y, :);

    a1 = [ones(m, 1) X]';
    z2 = theta1 * a1;
    a2 = [ones(1, columns(z2)); sigmoid(z2)];
    a3 = sigmoid(theta2 * a2);

    regression_param = sum(sum(theta1(:, 2 : end) .^ 2, 2)) + sum(sum(theta2(:, 2 : end) .^ 2, 2));
    regression_param = regression_param * lambda / (2 * m);

    cross_entropy = sum(sum((-Yexpanded)' .* log(a3) - (1 - Yexpanded)' .* log(1 - a3), 2));
    cross_entropy = cross_entropy / m;

    J = cross_entropy + regression_param;

    sigma3 = a3 - Yexpanded';
    delta2 = sigma3 * a2';
    sigma2 = (theta2' * sigma3 .* Dsigmoid([ones(1, columns(z2)); z2]))(2 : end, :);
    delta1 = sigma2 * a1';
    
    grad1 = delta1 + lambda * [zeros(size(theta1, 1), 1) theta1(:, 2 : end)];
    grad1 = grad1 ./ m;

    grad2 = delta2 + lambda * [zeros(size(theta2, 1), 1) theta2(:, 2 : end)];
    grad2 = grad2 ./ m;

    grad = [grad1(:) ; grad2(:)];
end
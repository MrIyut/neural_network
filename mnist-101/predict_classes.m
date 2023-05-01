function [classes] = predict_classes(X, weights, input_layer_size, hidden_layer_size, output_layer_size)
    [theta1 theta2] = separate_weights(weights, input_layer_size, hidden_layer_size, output_layer_size);

    classes = zeros(rows(X), 1);
    a1 = [ones(rows(X), 1) X]';
    z2 = theta1 * a1;
    a2 = [ones(1, columns(z2)); sigmoid(z2)];
    a3 = sigmoid(theta2 * a2);

    [score, classes] = max(a3, [], 1);
    classes = classes';
endfunction

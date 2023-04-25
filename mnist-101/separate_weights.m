function [theta1, theta2] = separate_weights(params, input_layer_size, hidden_layer_size, output_layer_size)
    theta1_elements = hidden_layer_size * (input_layer_size + 1);
    theta1 = reshape(params(1: theta1_elements), hidden_layer_size, input_layer_size + 1);
    theta2 = reshape(params((theta1_elements + 1): rows(params)), output_layer_size, hidden_layer_size + 1);
endfunction

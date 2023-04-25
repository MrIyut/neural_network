function [output] = Dsigmoid(input)
    sig = sigmoid(input);
    output = sig .* (1 - sig);
endfunction

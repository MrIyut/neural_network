function [X_train, y_train, X_test, y_test] = split_dataset(X, y, percent)
    entries = rows(X);
    shuffle = randperm(entries);
    X_shuffled = X(shuffle, :);
    y_shuffled = y(shuffle, :);

    target = round(percent * entries);
    X_train = X_shuffled(1 : target, :);
    X_test = X_shuffled((target + 1) : end, :);
    y_train = y_shuffled(1 : target, :);
    y_test = y_shuffled((target + 1) : end, :);
endfunction

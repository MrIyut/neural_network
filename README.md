# Markov is coming

`parse_labyrinth` -- loads into memory a labyrinth of size NxM from file \n
`get_adjacency_matrix` -- creates a matrix that stores the possible directions from a certain state in the labyrinth
`get_link_matrix` -- creates a matrix that stores the chances to move into a state from another one
`get_Jacobi_parameters` -- splits the link matrix into components to be able to perform the Jacobi algorithm
`perform_iterative` -- performs the Jacobi algorithm to determine the chances to reach the win state from a certain state
`heurestic_greedy` -- determines a path from the current location to the win state
`decode_path` -- displays the path into a more friendly format

# Linear regression

`parse_data_set_file` -- reads a data set from file
`prepare_for_regression` -- converts all the data into quantifiable data
`linear_regression_cost` -- computes the linear cost for the dataset
`parse_csv_file` -- loads a dataset from a csv file into memory
`gradient_descent` -- computes the model's coefficients using the gradient descent method
`normal_equation` -- computes the model's coefficients using the gradient conjugate method
`lasso_regression_cost_function` -- computes the regulated cost for the dataset, using the lasso regression method
`ridge_regression_cost_function` -- computes the regulated cost for the dataset, using the ridge regression method

# Mnist-101

`load_dataset` -- loads the dataset into memory
`split_dataset` -- shuffles the dataset into a training set and a testing set
`initialize_weights` -- randomly assigns the values of the network's weights with values between [-ε, ε], where ε = sqrt(6) / (previous_layer_size + next_layer_size)
`cost_function` -- returns the cost for the current weights of the network and the gradients with the network. The gradients are calculated performing backpropagation on the network
`predict_classes` -- returns the predictions for the entries provided.

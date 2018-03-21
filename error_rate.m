function [avg_error] = error_rate(m, datasetX, datasetY, algo)
%   This function uses cross-validation to return the average error rate
%   It takes "m" points at random from the "dataset" as the training set and
%   the rest forms the evaluation set. This functions repeats this 100
%   times and calculates the average error rate.
error_list = zeros(1,100);
 
for i = 1:1:100
    indices = randperm(length(datasetX));
    training_setX = datasetX(indices(1:m), :);
    training_setY = datasetY(indices(1:m));
    eval_setX = datasetX(indices(m+1:length(indices)), :);
    eval_setY = datasetY(indices(m+1:length(indices)));
    dimension = length(datasetX(1, :));

    if algo == 'perceptron'
        perceptron = Perceptron(dimension, training_setX, training_setY);
        A = zeros(1, length(eval_setY));
        for i = 1:length(eval_setY)
            A(i) = perceptron.predict(eval_setX(i, :));
        end
        error_list(i) = isequal(A, eval_setY);
    end
   
avg_error = mean(error_list);
end
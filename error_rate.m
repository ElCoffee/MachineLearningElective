function [avg_error] = error_rate(m, datasetX, datasetY, algo, args)
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

    if strcmp(algo, 'perceptron');
        perceptron = Perceptron(dimension, training_setX, training_setY);
        A = zeros(1, length(eval_setY));
        for j = 1:length(eval_setY)
            A(j) = perceptron.predict(eval_setX(j, :));
        end
        error_list(i) = sum(A' ~= eval_setY);
    end
    if strcmp(algo, 'softsvm');
        softSVM = SoftSVM(dimension, training_setX, training_setY, args(1), args(2));
        A = zeros(1, length(eval_setY));
        for j = 1:length(eval_setY)
            A(j) = softSVM.predict(eval_setX(j, :));
        end
        error_list(i) = sum(A' ~= eval_setY);
    end
%     if strcmp(algo, 'softSVMMATLAB');
%         A = zeros(1, length(training_setY));
%         SVMModel = fitcsvm(X,Y,'KernelFunction','rbf',...
%     'Standardize',true,'ClassNames',{'negClass','posClass'});
%         for j = 1:length(training_setY)
%             A(j) = predict(SVMModel, training_setX(j));
%             
%     end
        
end

avg_error = mean(error_list)./(length(datasetY) - m);
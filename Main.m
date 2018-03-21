%% - MACHINE LEARNING ELECTIVE - %%
% Final coursework for an elective taught @CentraleSupélec by R. Combes

%% DATASET 1 : Perceptron algorithm
dataX = csvread('data_sets/data_set_1_X.csv');
dataY = csvread('data_sets/data_set_1_Y.csv');
% Question 1 : Question 1 Run the perceptron algorithm and plot average
% error rate as a function of m (parameter of the cross validation).

algo = 'perceptron';
error_values = []
for m=100:100:1000
    error_values = [error_values ; error_rate(m,dataX,dataY,algo)];
end
figure(1)
plot(1:100:1000,error_values)
title('Average error rate as a function of m')
legend('Average error rate')

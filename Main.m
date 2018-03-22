%% - MACHINE LEARNING ELECTIVE - %%
% Final coursework for an elective taught @CentraleSup?lec by R. Combes

%% DATASET 1 : Perceptron algorithm
dataX = csvread('data_sets/data_set_1_X.csv');
dataY = csvread('data_sets/data_set_1_Y.csv');
%% Question 1 :
% Run the perceptron algorithm and plot average
% error rate as a function of m (parameter of the cross validation).

algo = 'perceptron';
n=10;
factor=10000;
error_values = zeros(1,n);
for m=1:1:n
    error_values(m) = error_rate(m*factor, dataX, dataY, algo, []);
end
%% Plot of Q1
figure(1)
plot(1*factor:1*factor:n*factor,error_values)
xlim([0 10^5])
ylim([0 0.04])
title('Average error rate as a function of m')
legend('Average error rate')


%% DATASET 2 : Soft SVM with SGD
dataX = csvread('data_sets/data_set_2_X.csv');
dataY = csvread('data_sets/data_set_2_Y.csv');
%% Question 1

algo = 'softsvm';
n = 10;
m = 1e3;
mu_min = -5;
mu_max = 0;
mu = logspace(mu_min, mu_max, n);
eta = 0.5;
error_values = zeros(1,n);
for i = 1:n
    error_values(i) = error_rate(m, dataX, dataY, algo, [mu(i) eta]);
end
figure(2);
semilogx(mu, error_values);
%% DATASET 4 : Soft SVM with Gaussian kernel
dataX = csvread('data_sets/data_set_4_X.csv');
dataY = csvread('data_sets/data_set_4_Y.csv');

close all;

blueLabels = (dataY == 1);
redLabels = (dataY == -1);

blueX = dataX(blueLabels, [1 2]);
scatter(blueX(:, 1), blueX(:, 2), 1, 'b');
hold on;
redX = dataX(redLabels, [1 2]);
scatter(redX(:, 1), redX(:, 2), 1, 'r');
title('Scatter plot of coordinates x1, x2 with blue color for positive label');
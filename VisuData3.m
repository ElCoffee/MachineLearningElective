%% DATASET 3 : Soft SVM with kernel algorithm
dataX = csvread('data_sets/data_set_3_X.csv');
dataY = csvread('data_sets/data_set_3_Y.csv');

close all;

blueLabels = (dataY == 1);
redLabels = (dataY == -1);

blueX = dataX(blueLabels, [1 2]);
subplot(221);
scatter(blueX(:, 1), blueX(:, 2), 1, 'b');
hold on;
redX = dataX(redLabels, [1 2]);
scatter(redX(:, 1), redX(:, 2), 1, 'r');
title('Scatter plot of coordinates x1, x2 with blue color for positive label');

blueX = dataX(blueLabels, [1 3]);
subplot(222);
scatter(blueX(:, 1), blueX(:, 2), 1, 'b');
hold on;
redX = dataX(redLabels, [1 3]);
scatter(redX(:, 1), redX(:, 2), 1, 'r');
title('Scatter plot of coordinates x1, x3 with blue color for positive label');

blueX = dataX(blueLabels, [2 3]);
subplot(223);
scatter(blueX(:, 1), blueX(:, 2), 1, 'b');
hold on;
redX = dataX(redLabels, [2 3]);
scatter(redX(:, 1), redX(:, 2), 1, 'r');
title('Scatter plot of coordinates x2, x3 with blue color for positive label');

figure;
blueX = dataX(blueLabels, :);
scatter3(blueX(:, 1), blueX(:, 2), blueX(:, 3), 1, 'b');
hold on;
redX = dataX(redLabels, :);
scatter3(redX(:, 1), redX(:, 2), redX(:, 3), 1, 'r');
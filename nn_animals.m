% the result of applying PCA are attached below
% from line 29-33 corresponding to the build_animals line 34-52

% Initialization
clear ; close all; clc

% Load Training Data
fprintf('Loading and Visualizing Data ...\n')
load('data.mat');
count = size(X, 2);

% create a neural network
net = patternnet(100);

% divided into training, validation and testing simulate
net.divideParam.trainRatio = 0.8;    % 80% ����ѵ��ģ��
net.divideParam.valRatio = 0;
net.divideParam.testRatio = 0.2;     % 20% ����У��ģ����ȷ��

rand_indices = randperm(count);

% set up the training set and testing set
% ����ѵ�����Ͳ��Լ�
trainData = X(:, rand_indices(1:2400));
trainLabels = y(:, rand_indices(1:2400));
testData = X(:, rand_indices(2401:end));
testLabels = y(:, rand_indices(2401:end));

% %for applying PCA:
% trainData = X(rand_indices(1:2400));
% trainLabels = y(:, rand_indices(1:2400));
% testData = X(rand_indices(2401:end));
% testLabels = y(:, rand_indices(2401:end));

% train a neural network
% ѵ��NNģ��
[net, tr] = train(net, trainData, trainLabels);

% show the network
view(net);

preds = net(testData); 
est = vec2ind(preds) - 1;
tar = vec2ind(testLabels) - 1;

% find percentage of correct classifications
% ������ȷ��
accuracy = 100*length(find(est==tar))/length(tar);
fprintf('Accuracy rate is %.2f\n', accuracy);

% confusion matrix
% չʾͼ��
plotconfusion(testLabels, preds)
% plot the performace graph
plotperform(tr)

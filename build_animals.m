% Initialization
clear ; close all; clc

% extract all pictures name in the folder stored in a array
picture_list = dir('.\animals\*.jpg');
% count the number of picture
list_count = size(picture_list, 1);

for i = 1:list_count
    
    % read in all pictures（读取所有图）
    raw_picture_name = fullfile('.\animals', picture_list(i).name);
    raw_picture = imread(raw_picture_name);
    
    % change the picture into grayscale format (转RGB为灰度)
    grey_picture = im2double(rgb2gray(raw_picture));
    
    % step c: set the picture 200 * 200 or others（压缩图片为200 * 200像素）
    picture = imresize(grey_picture,[200,200]); 
    
    % step d: reshape the picture from 2D to 1D （把图像信息进一步压缩为1维）
    finish = reshape(picture, [1 40000]);
    
    % add the picture information to store in X
    X(i, :) = finish(1, :);
end

% get the transposed matrix of X
X = X';

% % PCA: reduce the dimension from 2D to 1D
% % calculate the average of each raw 
% raw = size(X, 1);
% col = size(X, 2);
% avg = mean(X, 2);
% % each cell subtract the average value
% for i = 1:raw
%     for j = 1:col
%         X(i, j) = X(i, j) - avg(i, 1);
%     end
% end
% 
% % calculate the covariance matrix of X
% A = X * X' / col;
% % get the eigenvalue
% [V, D] = eig(A);
% % get the 1D X
% P = V';
% X = P(end,:) * X;

% create labels data and vectorize
temp(1:1000) = 1;
temp(1000:2000) = 2;
temp(2000:3000) = 3;
y = im2double(full(ind2vec(temp))); 

% step f: save X and y in a dataset
clear temp raw_picture_name raw_picture picture_list picture list_count i grey_picture finish A D P V avg col j raw;
save('data.mat');

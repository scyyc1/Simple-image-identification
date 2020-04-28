# Simple-image-identification

This is a simple image processing program with NN model through matlab
The raw image data are in the animals director
The aim is to train a NN model to identiy the difference of cat, dog and panda

few steps to test it:

1. Run the 'build_animals' script:
This will generate an 'data.mat' to represent the image information in array form.
You can modify the the data set with the size of image that used for NN traning (Line 19)

2. Run the 'nn_animals' script:
This will tran the NN model with the 'data.mat' and plot the result.
you can modify the ratio of data in the dataset for traning/valification (Line 16 - 18)

3. The analysis please refer to analysis.pdf

这是一个简单的图像识别模型
训练的图像在animals文件夹里
目的是用训练能识别出猫、狗和熊猫的NN模型

1. build_animals:
生成用于NN模型训练的数据集：
主要功能为：
1）把图像的三维颜色信息（RGB）转换为二维灰度模式
2）压缩图像信息以方便NN模型抽象:
可以更改第19行代码得到不同大小的数据集
3）生成可以用于训练的数据集（data.mat）

2. nn_animals：
训练NN模型并展示测试的结果分析
可以更改用于训练和测试的比率（16-18行）以获取不同的效果

3. 结果分析可以参考analysis.pdf

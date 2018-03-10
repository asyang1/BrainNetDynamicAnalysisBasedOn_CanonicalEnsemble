function [ MatrixOut ] = NoDimensional( MatrixIn )
%UNTITLED2 Summary of this function goes here
%   将输入矩阵去量纲化，具体做法为，首先将最小值找出，通过最小值将所有值平移修改为正值，平移的后最小值的位置为人为设定的基准值，平移后将矩阵中的值除以最小值，从而得到无量纲化的值

%  获得矩阵寻找最小值
min_value = min(min(MatrixIn));

% 设定无量纲化基准值,即平移后的矩阵中最小值所在的位置，本次设为0.1
x = 0.1;

%获取矩阵大小
[r,c] = size(MatrixIn);

%若最小值小于0.1，则将矩阵里所有的数向右平移（最小值+0.1）个单位
%若最小值大于0.1，则将矩阵里所有的数向左平移（最小值+0.1）个单位
%若最小值等于0.1，则将矩阵里所有的数不用平移
if(min_value ~= 0.1)
    tempMatrix = MatrixIn - (min_value-x)*ones(r,c);
end

%平移结束后，矩阵中最小值为设定好的基准值，通过除以基准值进行去量纲化

for i = 1:r
    for j = 1:c
        MatrixOut(i,j) = tempMatrix(i,j)/x;
    end
end

end


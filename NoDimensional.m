function [ MatrixOut ] = NoDimensional( MatrixIn )
%UNTITLED2 Summary of this function goes here
%   ���������ȥ���ٻ�����������Ϊ�����Ƚ���Сֵ�ҳ���ͨ����Сֵ������ֵƽ���޸�Ϊ��ֵ��ƽ�Ƶĺ���Сֵ��λ��Ϊ��Ϊ�趨�Ļ�׼ֵ��ƽ�ƺ󽫾����е�ֵ������Сֵ���Ӷ��õ������ٻ���ֵ

%  ��þ���Ѱ����Сֵ
min_value = min(min(MatrixIn));

% �趨�����ٻ���׼ֵ,��ƽ�ƺ�ľ�������Сֵ���ڵ�λ�ã�������Ϊ0.1
x = 0.1;

%��ȡ�����С
[r,c] = size(MatrixIn);

%����СֵС��0.1���򽫾��������е�������ƽ�ƣ���Сֵ+0.1������λ
%����Сֵ����0.1���򽫾��������е�������ƽ�ƣ���Сֵ+0.1������λ
%����Сֵ����0.1���򽫾��������е�������ƽ��
if(min_value ~= 0.1)
    tempMatrix = MatrixIn - (min_value-x)*ones(r,c);
end

%ƽ�ƽ����󣬾�������СֵΪ�趨�õĻ�׼ֵ��ͨ�����Ի�׼ֵ����ȥ���ٻ�

for i = 1:r
    for j = 1:c
        MatrixOut(i,j) = tempMatrix(i,j)/x;
    end
end

end


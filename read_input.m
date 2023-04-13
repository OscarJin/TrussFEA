function [E,A,nodes,Nnode,elements,Nelem,bcs,Nbc,loads] = read_input(input_filename)
%READ_INPUT 从文本文件读取输入数据并返回相应的数据矩阵
%   E，材料模量，A杆横截面积，xs，节点x坐标，ys，节点y坐标
fid = fopen(input_filename, 'r');

% 读取材料属性和杆直径
E=fscanf(fid, '%d',1);
d=fscanf(fid, '%f',1);
A=pi*(d/2)^2;

% 读取节点和单元数量
Nnode=fscanf(fid, '%d',1);
Nelem=fscanf(fid, '%d',1);

% 读取节点坐标
nodes = fscanf(fid, '%f %f', [2, Nnode])';
% 读取单元两端节点编号
elements = fscanf(fid, '%d %d', [2, Nelem])';

% 读取边界条件
Nbc = fscanf(fid, '%d', 1);
bcs = fscanf(fid, '%d %d', [2, Nbc])';

% 读取载荷数据
loads = fscanf(fid, '%f', [1, Nnode*2])';

fclose(fid);
end


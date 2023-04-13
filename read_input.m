function [E,A,nodes,Nnode,elements,Nelem,bcs,Nbc,loads] = read_input(input_filename)
%READ_INPUT ���ı��ļ���ȡ�������ݲ�������Ӧ�����ݾ���
%   E������ģ����A�˺�������xs���ڵ�x���꣬ys���ڵ�y����
fid = fopen(input_filename, 'r');

% ��ȡ�������Ժ͸�ֱ��
E=fscanf(fid, '%d',1);
d=fscanf(fid, '%f',1);
A=pi*(d/2)^2;

% ��ȡ�ڵ�͵�Ԫ����
Nnode=fscanf(fid, '%d',1);
Nelem=fscanf(fid, '%d',1);

% ��ȡ�ڵ�����
nodes = fscanf(fid, '%f %f', [2, Nnode])';
% ��ȡ��Ԫ���˽ڵ���
elements = fscanf(fid, '%d %d', [2, Nelem])';

% ��ȡ�߽�����
Nbc = fscanf(fid, '%d', 1);
bcs = fscanf(fid, '%d %d', [2, Nbc])';

% ��ȡ�غ�����
loads = fscanf(fid, '%f', [1, Nnode*2])';

fclose(fid);
end


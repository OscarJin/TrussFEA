function [E,A,nodes,Nnode,elements,Nelem,bcs,Nbc,loads] = read_input(input_filename)
%READ_INPUT Read input data from a file
%   E, Young's modulus of the material
%   A, section area of the truss
%   Nnode, number of nodes
%   nodes, a Nnode*2 matrix of x and y coordiates of nodes
%   Nelem. number of elements
%   elements, a Nelem*2 matrix of elements between two nodes
%   Nbc, number of boundary conditions
%   bcs, a Nbc*2 matrix of boudary conditions (nodes, directions)
%   loads, a (Nnode*2)*1 matrix of loads
fid = fopen(input_filename, 'r');

% Read material property and diameter of truss
E=fscanf(fid, '%d',1);
d=fscanf(fid, '%f',1);
A=pi*(d/2)^2;

% Read Nnode and Nelem
Nnode=fscanf(fid, '%d',1);
Nelem=fscanf(fid, '%d',1);

% Read nodes
nodes = fscanf(fid, '%f %f', [2, Nnode])';
% Read elements
elements = fscanf(fid, '%d %d', [2, Nelem])';

% Read BCs
Nbc = fscanf(fid, '%d', 1);
bcs = fscanf(fid, '%d %d', [2, Nbc])';

% Read loads
loads = fscanf(fid, '%f', [1, Nnode*2])';

fclose(fid);
end


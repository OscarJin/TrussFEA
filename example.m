clc;
clear;
% read from input file
[E,A,nodes,Nnode,elements,Nelem,bcs,Nbc,loads]=read_input('input.txt');
% solve nodal displacements
[u,C]=SolveBarFEM(E,A,nodes,Nnode,elements,Nelem,bcs,Nbc,loads);

% post-process
[R,strain,stress]=post_process(E,nodes,elements,Nelem,bcs,Nbc,u,C);

output_txt('output.txt',u,R,strain,stress);

plot_result(nodes,Nnode,elements,Nelem,u);
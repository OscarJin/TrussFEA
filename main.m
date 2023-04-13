clc;
clear;
[E,A,nodes,Nnode,elements,Nelem,bcs,Nbc,loads]=read_input('input.txt');

[u,C]=SolveBarFEM(E,A,nodes,Nnode,elements,Nelem,bcs,Nbc,loads);

[R,strain,stress]=post_process(E,nodes,elements,Nelem,bcs,Nbc,u,C);

save('result.mat','u','R','strain','stress');
function [u,C] = SolveBarFEM(E,A,nodes,Nnode,elements,Nelem,bcs,Nbc,loads)
%SOLVEBARFEM Solve node displacement

k=zeros(4,4,Nelem);
for i=1:Nelem
    node1=elements(i,1);
    node2=elements(i,2);
    k(:,:,i)=Bar2D_Stiffness(E,A,nodes(node1,1),nodes(node1,2),nodes(node2,1),nodes(node2,2));
end

% Assemble k's to KK
KK=zeros(Nnode*2);
for i=1:Nelem
    node1=elements(i,1);
    node2=elements(i,2);
    KK=Bar2D_Assembly(KK,k(:,:,i),node1,node2);
end

% Boundary conditions
C=max(max(KK))*1e4;
for i=1:Nbc
    bc=bcs(i,1)*2+bcs(i,2)-2;
    KK(bc,bc)=KK(bc,bc)+C;
end

u=KK\loads;
end


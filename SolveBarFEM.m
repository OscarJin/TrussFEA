function [u,C] = SolveBarFEM(E,A,nodes,Nnode,elements,Nelem,bcs,Nbc,loads)
%SOLVEBARFEM 求解节点位移

k=zeros(4,4,Nelem);
for i=1:Nelem
    node1=elements(i,1);
    node2=elements(i,2);
    k(:,:,i)=Bar2D_Stiffness(E,A,nodes(node1,1),nodes(node1,2),nodes(node2,1),nodes(node2,2));
end

%建立整体刚度方程
KK=zeros(Nnode*2,Nnode*2);
for i=1:Nelem
    node1=elements(i,1);
    node2=elements(i,2);
    KK=Bar2D_Assembly (KK,k(:,:,i),node1,node2);
end

%边界条件的处理及刚度方程求解
C=max(max(KK))*1e4;
for i=1:Nbc
    bc=bcs(i,1)*2+bcs(i,2)-2;
    KK(bc,bc)=KK(bc,bc)+C;
end

u=KK\loads;
end


function [R,strain,stress] = post_process(E,nodes,elements,Nelem,bcs,Nbc,u,C)
%POST_PROCESS 

% Calculate counterforce
R=zeros(Nbc, 2);
for i=1:Nbc
    bc=bcs(i,1)*2+bcs(i,2)-2;
    R(i,1)=bc;
    R(i,2)=-C*u(bc);
end

% Element strain
strain=zeros(Nelem,1);
for i=1:Nelem
    node1=elements(i,1);
    node2=elements(i,2);
    x1=nodes(node1,1); y1=nodes(node1,2);x2=nodes(node2,1); y2=nodes(node2,2);
    dx = x2-x1; dy = y2-y1;
    L = sqrt(dx*dx + dy*dy);
    Cos = dx/L;
    Sin = dy/L;
    strain(i) = (u(node2*2-1) - u(node1*2-1)) * Cos + (u(node2*2) - u(node1*2)) * Sin;
    strain(i) = strain(i)/L;
end

% Element stress
stress=E*strain;

end


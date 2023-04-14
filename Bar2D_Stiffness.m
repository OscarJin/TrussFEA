function k = Bar2D_Stiffness(E,A,x1,y1,x2,y2)
%Bar2D_Stiffness Calculate stiffness matrix of an element
%   input E,A
%   input coordinates of two nodes (x1, y1), (x2, y2)
%   output stiffness matrix (4x4) of the element

dx = x2-x1;
dy = y2-y1;
L = sqrt(dx*dx + dy*dy);
C = dx/L;
S = dy/L;
k=E*A/L*[C*C C*S -C*C -C*S
         C*S S*S -C*S -S*S
         -C*C -C*S C*C C*S
         -C*S -S*S C*S S*S];
end


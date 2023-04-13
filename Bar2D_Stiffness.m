function k = Bar2D_Stiffness(E,A,x1,y1,x2,y2)
%Bar2D_Stiffness 计算单元的刚度矩阵
%   输入弹性模量E，横截面积A
%   输入第一个节点坐标（x1,y1），第二个节点坐标（x2,y2）
%   输出单元刚度矩阵k(4x4)

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


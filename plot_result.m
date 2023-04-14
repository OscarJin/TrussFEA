function plot_result(nodes,Nnode,elements,Nelem,u)
%PLOT_RESULT 输出图形
%   变形前，变形后的图形

nodes_u = zeros(Nnode,2);
for i = 1:Nnode
    nodes_u(i,1) = nodes(i,1) + u(2*i-1,1);
    nodes_u(i,2) = nodes(i,2) + u(2*i,1);
end
% 邻接矩阵
A = zeros(Nnode);
for i = 1:Nelem
    node1=elements(i,1);
    node2=elements(i,2);
    A(node1, node2) = 1;
    A(node2, node1) = 1;
end

gplot(A,nodes,'bo-');   %画变形前的图
hold on
gplot(A,nodes_u,'ro-');%变形后的图
hold off

xlabel('x (m)','FontName','Times New Roman','FontSize',16);
ylabel('y (m)','FontName','Times New Roman','FontSize',16);
legend1=legend('Undeformed','Deformed','Interpreter','tex');
set(legend1,...
    'FontSize',12,...
    'Interpreter','latex',...
    'FontName','Times New Roman',...
    'EdgeColor','none',...
    'Color','none');
axes1= gca;
set(axes1,'FontName','Times New Roman','FontSize',12,'XMinorTick','on','YMinorTick','on');
box(axes1,'on');
end


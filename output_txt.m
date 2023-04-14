function output_txt(filename,u,R,strain,stress)
%OUTPUT_TXT 输出结果至文本文件
%   输出节点位移、反作用力、单元应变和应力
fid = fopen(filename,'w');

% 输出节点位移
fprintf(fid, 'Node\tu/m\n');
for i=1:length(u)
    fprintf(fid, '%d\t%.4f\n', i, u(i));
end

% 输出反作用力
fprintf(fid, 'Node\tDirection\tCounterforce/N\n');
for i=1:length(R)
    if mod(R(i,1),2)==0
        node=R(i,1)/2;
        fprintf(fid, '%d\ty\t%.4f\n',node,R(i,2));
    else
        node=(R(i,1)+1)/2;
        fprintf(fid, '%d\tx\t%.4f\n',node,R(i,2));
    end
end

% 输出单元应力和应变
fprintf(fid, 'Element\tStrain/m\tStress/N\n');
for i=1:length(strain)
    fprintf(fid, '%d\t%.4f\t%.4f\n', i,strain(i),stress(i));
end
end


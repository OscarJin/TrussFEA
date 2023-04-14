function output_txt(filename,u,R,strain,stress)
%OUTPUT_TXT ���������ı��ļ�
%   ����ڵ�λ�ơ�������������ԪӦ���Ӧ��
fid = fopen(filename,'w');

% ����ڵ�λ��
fprintf(fid, 'Node\tu/m\n');
for i=1:length(u)
    fprintf(fid, '%d\t%.4f\n', i, u(i));
end

% �����������
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

% �����ԪӦ����Ӧ��
fprintf(fid, 'Element\tStrain/m\tStress/N\n');
for i=1:length(strain)
    fprintf(fid, '%d\t%.4f\t%.4f\n', i,strain(i),stress(i));
end
end


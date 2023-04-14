function output_txt(output_filename,u,R,strain,stress)
%OUTPUT_TXT Output results to a txt file
%   Output node displacements, counterforces, element strains and stresses
fid = fopen(output_filename,'w');

% output u
fprintf(fid, 'Node\tux/m\tuy/m\n');
for i=1:length(u)/2
    fprintf(fid, '%d\t%.4f\t%.4f\n', i, u(i*2-1), u(i*2));
end

% output R
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

% output strain and stress
fprintf(fid, 'Element\tStrain/m\tStress/N\n');
for i=1:length(strain)
    fprintf(fid, '%d\t%.4f\t%.4f\n', i,strain(i),stress(i));
end

fclose(fid);
end


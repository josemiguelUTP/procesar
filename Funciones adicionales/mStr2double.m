function [ double ] = mStr2double( m )
%Convierte una matriz de sring en numeros
double=zeros(size(m,1),1);
%tic
for i=1:size(m,1)
    double(i)=str2double(m(i,:));
end
%tem=mat2cell(m,ones(length(m),1),2); 13.0 s
%double=str2double(tem);
%toc
end
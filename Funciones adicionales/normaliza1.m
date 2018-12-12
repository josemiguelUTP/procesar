function [ mat ] = normaliza1( mat )
%mat=normaliza(mat) normaliza cada columna de la matriz mat con los valores
%maximos globales y media de cada columna 
[~,n]=size(mat);
media=mean(mat);
maxi=max(max(mat));
for i=1:n
    mat(:,i)=(mat(:,i)-media(i))/(maxi-media(i));
end
end
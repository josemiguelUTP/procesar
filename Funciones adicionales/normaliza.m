function [ mat,N ] = normaliza( mat )
%mat=normaliza(mat) normaliza cada columna de la matriz mat con los valores
%maximos y media de cada columna
[~,n]=size(mat);
media=mean(mat);
maxi=max(mat)-media;
N=[media;maxi];
for i=1:n
    mat(:,i)=(mat(:,i)-media(i))/maxi(i);
end
end


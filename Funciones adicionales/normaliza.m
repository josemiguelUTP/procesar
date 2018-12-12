function [ mat,N ] = normaliza( mat )
%mat=normaliza(mat) normaliza cada columna de la matriz mat con los valores
%maximos y media de cada columna
[m,n]=size(mat);
media=mean(mat);
maxi=max(mat)-media;
N=[media;maxi];
for i=1:n
    if maxi(i)==0
    mat(:,i)=zeros(m,1);    
    else
    mat(:,i)=(mat(:,i)-media(i))/maxi(i);
    end
end
end


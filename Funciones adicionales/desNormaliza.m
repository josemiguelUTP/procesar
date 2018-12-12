function [ mat ] = desNormaliza( mat,N )
%[ mat ] = desNormaliza( mat,N ) devuelve a sus valores originales la
%matriz normalizada mat.
[~,n]=size(mat);
media=N(1,:);
maxi=N(2,:);
for i=1:n
    mat(:,i)=mat(:,i)*maxi(i)+media(i);
end

end


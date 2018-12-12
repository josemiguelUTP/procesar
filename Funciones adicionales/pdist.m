function D = pdist(X,Y)
%Calcula la distancia euclidiana entre X y cada fila de Y
[m,~]=size(Y);
D=zeros(m,1);
for i=1:m
    D(i)=sqrt(sum(power(X-Y(i,:),2),2));
end
end

function corr=corrcoef(X,Y)
%Entrega la correlacion entre X y cada fila de Y
[m,n]=size(Y);
X=X-mean(X);
Y=Y-mean(Y,2)*ones(1,n);
C12=Y*X'/(n-1);
C11=X*X'/(n-1);
C22=zeros(m,1);
for i=1:m
    C22(i)=Y(i,:)*(Y(i,:))'/(n-1);
end
corr=zeros(m,1);
for i=1:m
    corr(i)=C12(i)/sqrt(C11*C22(i));
end
end

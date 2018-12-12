function [ transiciones ] = transicionesUni( clasifica )
%[ transiciones ] = transicionesUni( clasifica )
%   Crea una matriz dispersa mX2 con la estructura (patronAnt,patronSig) ocurrencias
%   que almacena la cantidad de ocurrencias en las que de un patronAnt pasa
%   a un patronSig en el vector clasifica
dif=~(clasifica(1:end-1)==clasifica(2:end));
dif(end+1)=dif(end);
dif(2:end)=dif(2:end)|dif(1:end-1);
clasifica=clasifica(dif);
m=length(dif);
clear dif;
cant=0;
K=zeros(m-1,1);
L=zeros(m-1,1);
v=ones(m-1,1);
for i=2:length(clasifica)
    if ~(clasifica(i)==clasifica(i-1))
       cant=cant+1;
       K(cant)=clasifica(i-1);
       L(cant)=clasifica(i);
    end
end
K=K(1:cant);
L=L(1:cant);
v=v(1:cant);
transiciones=sparse(K,L,v);
end
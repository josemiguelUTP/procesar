function [data,nanIndex,inRaros1,inRaros2] = crearPAng(PATHS)
%Crea los patrones que contienen los angulos de las hidroelectricas,
%asumiendo que las columnas de los archivos en PATHS ya están alineadas y
%son
%1:Frecuencia
%2:VA
%3:TethaA
%4:VB
%5:TethaB
%6:VC
%7:TethaC
hidr=length(PATHS);
data=crearPC(PATHS,[3,5,7]);
nC=size(data,2)/hidr; %Cantidad de columnas por hidroelectrica
%Hallando diferencias angulares entre fases A-B, B-C y C-A
pi=1;
pf=pi+nC-1;
for i=1:hidr
    tem=data(:,pi);
    for j=pi:pf-1
        data(:,j)=difAng(data(:,j),data(:,j+1));
    end
    data(:,pf)=difAng(data(:,pf),tem);
    pi=pf+1;
    pf=pi+nC-1;
end

%Se encuentra el indice de las filas que tienen al menos un elemento nan
preNan=zeros(length(data(:,1)),1);
n=size(data,2);
for i=1:n
    preNan=preNan+isnan(data(:,i));
end
nanIndex=find(preNan);
%Encuentra los indices de las filas en las que hay al menos un valor
%extraño, siendo extraño un valor mayor a 124 o menor a 116 pues reflejaria
%un desbalance entre las fases.
%Se separaran inRaros en inRaros1 y inRaros2, donde inRaros1 son los
%indices raros mayores a 0 e inRaros2 son los indices raros menores o
%iguales a 0
for i=1:n
    if i==1
        raros=data(:,i)>124|data(:,i)<116;
        raros1=raros&data(:,i)>0;
        raros2=raros&data(:,i)<=0;
    else
        raros=data(:,i)>124|data(:,i)<116;
        raros1=raros1|(raros&data(:,i)>0);
        raros2=raros2|(raros&data(:,i)<=0);
    end    
end
inRaros1=find(raros1);
inRaros2=find(raros2);
end
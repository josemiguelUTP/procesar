function [ data,nanIndex ] = crearPC( PATHS,cols )
%[data,nanIndex]=crearP( PATHS,cols ) genera un conjunto de patrones formados por las
%columnas ingresadas en cols de las hidroeléctricas contenidas
%en PATHS pero con los datos de cada hidroelectrica en columnas contiguas, ademas devuelve los indices en los que hay valores NaN en data
%% Prealocacion de variables
hidr=length(PATHS);
nC=length(cols); %Determinacion de cantidad de columnas que corresponden a cada hidroelectrica
n=hidr*nC; %Determinacion de cantidad de columnas de cada patron
title='Creando patrones ';
indent=0;
modo='text';
h=progress1(indent,title,0,modo);
%ind1=linspace(1,m-2,m-2);
%ind2=linspace(3,m,m-2);
%% Creacion de patrones
pi=1;
pf=pi+nC-1;
for i=1:hidr
    path=PATHS{i};
    tem=struct2array(load(path));
    if i==1
        [m,~]=size(tem);
        data=zeros(m,n);
    end
    data(:,pi:pf)=tem(:,cols);
    pi=pf+1;
    pf=pi+nC-1;
    h=progress1(indent,title,i/hidr,h,'text');
end
preNan=zeros(length(data(:,1)),1);
for i=1:n
    preNan=preNan+isnan(data(:,i));
end
nanIndex=find(preNan);
end
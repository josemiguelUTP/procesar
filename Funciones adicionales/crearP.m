function [ data,nanIndex ] = crearP( PATHS,cols,mCols )
%[data,nanIndex]=crearP( PATHS,cols ) genera un conjunto de patrones formados por las
%columnas ingresadas en cols y las pendientes de mCols de las hidroeléctricas contenidas
%en PATHS, ademas devuelve los indices en los que hay valores NaN en data
%% Prealocacion de variables
hidr=length(PATHS);
nC=(length(cols)+length(mCols)); %Determinacion de cantidad de columnas que corresponden a cada hidroelectrica
n=hidr*nC; %Determinacion de cantidad de columnas de cada patron
title='Creando patrones ';
indent=0;
modo='text';
h=progress1(indent,title,0,modo);
ind=sort([cols,mCols]);
%ind1=linspace(1,m-2,m-2);
%ind2=linspace(3,m,m-2);
%% Creacion resto de patrones
iCols=cols*0;
iMCols=mCols*0;
j=1;
k=1;
M=length(cols);
N=length(mCols);
for i=1:hidr:n
    if M>0
        if N>0
            if cols(j)<=mCols(k)
                iCols(j)=i;
                j=j+1;
                M=M-1;
            else
                iMCols(k)=i;
                k=k+1;
                N=N-1;
            end
        else
            iCols(j)=i;
            j=j+1;
            M=M-1;
        end
    elseif N>0
        iMCols(k)=i;
        k=k+1;
        N=N-1;
    end
end
for i=1:hidr
    path=PATHS{i};
    tem=struct2array(load(path));
    if i==1
        [m,~]=size(tem);
        data=zeros(m,n);
        ind1=linspace(1,m-2,m-2);
        ind2=linspace(3,m,m-2);
    end
    data(:,iCols+(i-1))=tem(:,cols);
    data(3:end,iMCols+(i-1))=(tem(ind2,mCols)-tem(ind1,mCols));
    h=progress1(indent,title,i/hidr,h,'text');
end
data=data(3:end,:);
preNan=zeros(length(data(:,1)),1);
for i=1:n
    preNan=preNan+isnan(data(:,i));
end
nanIndex=find(preNan);
end
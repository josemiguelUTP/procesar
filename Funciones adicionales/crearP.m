function [ data,nanIndex ] = crearP( PATHS,cols,mCols )
%[data,nanIndex]=crearP( PATHS,cols ) genera un conjunto de patrones formados por las
%columnas ingresadas en cols y las pendientes de mCols de las hidroel�ctricas contenidas
%en PATHS, ademas devuelve los indices en los que hay valores NaN en data
%% Prealocacion de variables
uniCol=unique([cols,mCols]); %Columnas que se van a a�adir a los patrones ya sea por su valor o por su pendiente
hidr=length(PATHS);
nC=(length(cols)+length(mCols)); %Determinacion de cantidad de columnas que corresponden a cada hidroelectrica
n=hidr*nC; %Determinacion de cantidad de columnas de cada patron
nanIndex=cell(n,1);
title='Creando patrones ';
indent=0;
modo='text';
h=progress1(indent,title,0,modo);

%ind1=linspace(1,m-2,m-2);
%ind2=linspace(3,m,m-2);
%% Creacion resto de patrones
iCols=cols;
iMCols=mCols;
j=1;
k=1;
o=1;
for l=1:length(uniCol)
    if j<=length(cols)
        if cols(j)==l
            iCols(j)=o;
            o=o+1;
            j=j+1;
        end
    end
    if k<=length(mCols)
        if mCols(k)==l
            iMCols(k)=o;
            o=o+1;
            k=k+1;
        end
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
    data(:,iCols+(i-1)*nC)=tem(:,cols);
    data(3:end,iMCols+(i-1)*nC)=(tem(ind2,mCols)-tem(ind1,mCols));
    h=progress1(indent,title,i/hidr,h,'text');
end
data=data(3:end,:);
preNan=zeros(length(data(:,1)),1);
for i=1:n
    preNan=preNan+isnan(data(:,i));
end
nanIndex=find(preNan);
end
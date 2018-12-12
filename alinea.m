function [varargout]=alinea(center,varargin)
%Syntax:    1) interseccion=alinea(center,RUTAS,index)
%           2) [interseccion,data]=alinea(center,RUTAS,index,interseccion)
%
%   1) Encuentra la interseccion de fechas entre todas las hidroelectricas
%   en RUTAS, donde las rutas de cada hidroelectrica comienza en index, 
%Ejemplo:
%   Para RUTAS={ 'h11.csv';
%                'h12.csv';
%                'h13.csv';
%                'h14.csv';
%                'h21.csv';
%                'h22.csv';
%                'h31.csv';
%                'h32.csv';
%                'h33.csv';
%                }
%   index=[1,5,7,10]
%   2) Devuelve los datos de las hidroelectricas en el intervalo determinado
%   por interseccion

%% Separacion de hidroelectricas
RUTAS=varargin{1};
index=varargin{2};
cantHidro=length(index)-1;
Fechas=zeros(cantHidro,2);
paths=cell(cantHidro,1);
for i=1:cantHidro
    paths{i}=RUTAS(index(i):index(i+1)-1);
end
%% Fecha inicial y fecha final de las hidroelectricas la enea el guavio y cerromatoso
if (nargin-1)==2
    %Tarda 300 segundos en correr en los equipos de Sirius
    %tFechas=cell(cantHidro,1);
    for i=1:cantHidro
        prctg=(i-1)*100/cantHidro;
        indent=0;
        title='Extrayendo fechas:';
        progress(title,prctg,indent);
        %Tiempo para cerromatoso la enea y el guavio2 es de aproximadamente 300
        %segundos
        %[tFechas{i},Fechas(i,1),Fechas(i,2)]=extrae(paths{i},center);
        [~,Fechas(i,1),Fechas(i,2)]=extrae(paths{i},center);
    end
    prctg=100;
    progress(title,prctg,indent);
    %% Interseccion entre las fechas de estas hidroelectricas
    %Interseccion=[fecha inicial de interseccion, fecha final de interseccion]
    interseccion=[max(Fechas(:,1)),min(Fechas(:,2))];
elseif (nargin-1)==3
    interseccion=varargin{3};
end
varargout{1}=interseccion;
%% Busqueda de la fecha en cada uno de los datos para recortarlos
data=cell(cantHidro,2);
if nargout==2&&(nargin-1)==3
    title='Recortando archivos';
    indent=4;
    for i=1:cantHidro
        cantArchi=length(paths{i});
        d=[];
        t=[];
        for j=1:cantArchi
            prctg=(j-1)*100/cantArchi;          
            progress(title,prctg,indent);
            Info=extrae(paths{i}(j),center);
            Info=Info{1};
            %Alinear columnas
            [dt,tt]=cortar(Info,interseccion,center);
            d=[d;dt];
            t=[t;tt];
        end
        prctg=100;
        progress(title,prctg,indent);
        data{i,1}=d;
        data{i,2}=t;
    end
    varargout{2}=data;
end
end
function [x1] = newtRaph(textdata,F,center)
%newtRaph devuelve la posicion en la que se encuentra fecha F en textdata
%   textdata es un cellarray que contiene las fechas en formato texto tal
%   como lo entrega importdata, y fecha es la fecha buscada  (Convertida
%   con la funcion DateStr2U
notFound=true;
x00=3;
x1a=0;
while notFound
    
    fx00=Str2U(textdata(x00,1),textdata(x00,2),center);
    fx01=Str2U(textdata(x00+1,1),textdata(x00+1,2),center);
    
    df=fx01-fx00;
    x1=round((F-fx00)/df)+x00;
    if x1>size(textdata,1)
        x1=size(textdata,1);
    end
    if x1<3
        x1=0;
        return
    end
    fx1=Str2U(textdata(x1,1),textdata(x1,2),center);
    notFound=~(fx1==F);
    if x1a==x1&&notFound
        x1=0;
        notFound=~notFound;
    end
    x1a=x1;
    x00=round((x1-x00)/2)+x00;
end
end
function [ data,textdata ] = cortar( Info,interseccion,center )
%cortar Entrega una matriz data con los valores numericos que est�n entre
%las fechas {interseccion(1),interseccion(2)} asi como las fechas de cada
%uno
%% Inicializacion de variables
fi=Str2U(Info.textdata(3,1),Info.textdata(3,2),center);
ff=Str2U(Info.textdata(end,1),Info.textdata(end,2),center);
i1=interseccion(1);
i2=interseccion(2);
data=0;
textdata=0;
%% Verificacion de los cuatro casos
if i1>=fi
    if i2<=ff
        %caso 1
        [ data,textdata ]=caso1(Info,interseccion,center);
    elseif i1<=ff
        %caso 2
        [ data,textdata ]=caso2(Info,interseccion,center);
    end
else
    if ~(i2<=ff)
        %Caso 4
        [ data,textdata ]=caso4(Info,interseccion,center);
    elseif i2>=fi
        %Caso 3
        [ data,textdata ]=caso3(Info,interseccion,center);
    end
end
if (i1>ff||i2<fi)
    %Caso 5
    [data,textdata] =caso5(Info,interseccion,center);
end
    function [data,textdata] =caso1(Info,interseccion,center)
        i1=interseccion(1);
        i2=interseccion(2);
        index1=newtRaph(Info.textdata,i1,center);
        index2=newtRaph(Info.textdata,i2,center);
        [data,textdata]=recorte(Info,index1,index2);
    end
    function [data,textdata] =caso2(Info,interseccion,center)
        i1=interseccion(1);
        index=newtRaph(Info.textdata,i1,center);
        [data,textdata]=recorteIZQ(Info,index);
    end
    function [data,textdata] =caso3(Info,interseccion,center)
        i2=interseccion(2);
        index=newtRaph(Info.textdata,i2,center);
        [data,textdata]=recorteDER(Info,index);
    end
    function [data,textdata] =caso4(Info,~,~)
        [data,textdata]=recorte(Info,3,length(Info.textdata));
    end
    function [data,textdata] =caso5(~,~,~)
        data=[];
        textdata=[];
    end
    function [data,textdata] = recorte(Info,indice1,indice2)
        %Recorte Recorta por la derecha la matriz Info.data desde indice1 hasta
        %indice2
        %   Detailed explanation goes here
        data=Info.data(indice1-2:indice2-2,:);
        textdata=Info.textdata(indice1:indice2,1:2);
    end
    function [data,textdata] = recorteDER(Info,indice)
        %RecorteDER Recorta por la derecha la matriz Info.data desde indice hasta
        %end
        %   Detailed explanation goes here
        data=Info.data(1:indice-2,:);
        textdata=Info.textdata(3:indice,1:2);
    end
    function [data,textdata] = recorteIZQ(Info,indice)
        %RecorteIZQ Recorta por la izquierda la matriz Info.data desde 1 hasta
        %indice
        %   Detailed explanation goes here
        data=Info.data;
        data=data(indice-2:end,:);
        textdata=Info.textdata;
        textdata=textdata(indice:end,1:2);
    end
end
function  varargout  = extrae( Path,center )
%Almacena en un array de estructuras los datos almacenados en los archivos
%(Archivos) almacenados en (Path)
%   Info=extrae(Path,center)
%   [Fechas,fechaInicial,fechaFinal]=extrae(Path,center)
%   [fechaInicial,fechaFinal]=extrae(Path,center)

nArchivos=length(Path);
Fechas=zeros(nArchivos,2);
Info=cell(nArchivos,1);
title='Extrayendo archivos:';
indent=4;
for i=1:nArchivos
    if nArchivos>1
    prctg1=(i-1)*100/nArchivos;
    progress(title,prctg1,indent);
    end
    %archivo=Archivos{i};
    %Ruta=[Path,'\',archivo];
    Ruta=Path{i};
    temp=importdata(Ruta);
    if nargout==1
        Info{i}=temp;
    end
    %Solo se trabajar� con la primera y ultima fila
    fechaInicial=Str2U(temp.textdata(3,1),temp.textdata(3,2),center);
    fechaFinal=Str2U(temp.textdata(end,1),temp.textdata(end,2),center);
    if nargout==3
        Fechas(i,:)=[fechaInicial,fechaFinal];
    end
end
if nArchivos>1
prctg1=100;
progress(title,prctg1,indent);
end
fechaInicial=min(Fechas(:,1));
fechaFinal=max(Fechas(:,2));
if nargout==1
    varargout{1}=Info;
elseif nargout==2
    varargout{1}=fechaInicial;
    varargout{2}=fechaFinal;
elseif nargout==3
    varargout{1}=Fechas;
    varargout{2}=fechaInicial;
    varargout{3}=fechaFinal;
end
end
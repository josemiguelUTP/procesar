function [interseccion,varargout]=alinea(center,RUTAS,index,varargin)
%Syntax:    1) interseccion=        alinea(center,RUTAS,index)
%           2) [interseccion,data]= alinea(center,RUTAS,index,interseccion)
%           3) [interseccion,data]= alinea(center,RUTAS,index)
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

%% varargin parse
cantHidro=length(index)-1;
Fechas=zeros(cantHidro,2);
paths=cell(cantHidro,1);
for i=1:cantHidro
    paths{i}=RUTAS(index(i):index(i+1)-1);
end
%% Estableciendo el modo de ejecucion
if nargin==3&&nargout==1
    caso=0;
elseif nargin==4&&nargout==2
    caso=1;
elseif nargin==3&&nargout==2
    caso=2;
else
    error('Syntax error');
end
%% Fecha inicial y fecha final de las hidroelectricas la enea el guavio y cerromatoso
if caso==0||caso==2
    %Tarda 300 segundos en correr en los equipos de Sirius
    %tFechas=cell(cantHidro,1);
    indent=1;
    title='Encontrando intersecciones: ';
    h1=progress1(indent,title,0);
    for i=1:cantHidro
        %Tiempo para cerromatoso la enea y el guavio2 es de aproximadamente 300
        %segundos
        %[tFechas{i},Fechas(i,1),Fechas(i,2)]=extrae(paths{i},center);
        [~,Fechas(i,1),Fechas(i,2)]=extrae(paths{i},center);
        title='Encontrando intersecciones: ';
        prctg=(i)/cantHidro;
        indent=0;
        h1=progress1(indent,title,prctg,h1);
    end
    
    %% Interseccion entre las fechas de estas hidroelectricas
    %Interseccion=[fecha inicial de interseccion, fecha final de interseccion]
    interseccion=[max(Fechas(:,1)),min(Fechas(:,2))];
elseif caso==1
    interseccion=varargin{1};
end
%% Busqueda de la fecha en cada uno de los datos para recortarlos
if caso==1||caso==2
    data=cell(cantHidro,2);
    title='Alineando hidroelectricas: ';
    indent=1;
    h2=progress1(indent,title,0);
    for i=1:cantHidro
        cantArchi=length(paths{i});
        d=[];
        t=[];
        title1='Recortando archivos: ';
        indent1=2;
        h3=progress1(indent1,title1,0);
        for j=1:cantArchi
            Info=extrae(paths{i}(j),center);
            Info=Info{1};
            %Alinear columnas
            [dt,tt]=cortar(Info,interseccion,center);
            d=[d;dt];
            t=[t;tt];
            prctg1=j/cantArchi;
            h3=progress1(indent1,title1,prctg1,h3);
        end
        data{i,1}=d;
        data{i,2}=t;
        prctg=i/cantHidro;
        h2=progress1(indent,title,prctg,h2);
    end
    varargout{1}=data;
end
end
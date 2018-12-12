function [varargout]=alinea(varargin)
%% Separacion de hidroelectricas
%[interseccion,data]
%RUTAS,index,interseccion
RUTAS=varargin{1};
index=varargin{2};
center=18;
cantHidro=length(index)-1;
Fechas=zeros(cantHidro,2);
paths=cell(cantHidro,1);
for i=1:cantHidro
    paths{i}=RUTAS(index(i):index(i+1)-1);
end
%% Fecha inicial y fecha final de las hidroelectricas la enea el guavio y cerromatoso
if nargin==2
%Tarda 300 segundos en correr en los equipos de Sirius
%tFechas=cell(cantHidro,1);
for i=1:cantHidro
    %Tiempo para cerromatoso la enea y el guavio2 es de aproximadamente 300
    %segundos
    %[tFechas{i},Fechas(i,1),Fechas(i,2)]=extrae(paths{i},center);
    [~,Fechas(i,1),Fechas(i,2)]=extrae(paths{i},center);
end
%% Interseccion entre las fechas de estas hidroelectricas
%Interseccion=[fecha inicial de interseccion, fecha final de interseccion]
interseccion=[max(Fechas(:,1)),min(Fechas(:,2))];
elseif nargin==3
    interseccion=varargin{3};
end
varargout{1}=interseccion;
%% Busqueda de la fecha en cada uno de los datos para recortarlos
data=cell(cantHidro,2);
if nargout==2&&nargin==3
for i=1:cantHidro
    cantArchi=length(paths{i});
    d=[];
    t=[];
    for j=1:cantArchi
        Info=extrae(paths{i}(j),center);
        Info=Info{1};
        %Alinear columnas
        [dt,tt]=cortar(Info,interseccion,center);
        d=[d;dt];
        t=[t;tt];
    end
    data{i,1}=d;
    data{i,2}=t;
end
varargout{2}=data;
end
end
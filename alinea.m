function [data]=alinea(RUTAS,index)
%% Separacion de hidroelectricas
cantHidro=length(index)-1;
Fechas=zeros(cantHidro,2);
paths=cell(cantHidro,1);
for i=1:cantHidro
    paths{i}=RUTAS(index(i):index(i+1)-1);
end
%% Fecha inicial y fecha final de las hidroelectricas la enea el guavio y cerromatoso
%Tarda 300 segundos en correr en los equipos de Sirius
center=18;
tFechas=cell(cantHidro,1);
for i=1:cantHidro
    tic
    [tFechas{i},Fechas(i,1),Fechas(i,2)]=extrae(paths{i},center);
    toc
end
%% Interseccion entre las fechas de estas hidroelectricas
%Interseccion=[fecha inicial de interseccion, fecha final de interseccion]
interseccion=[max(Fechas(:,1)),min(Fechas(:,2))];
%% Busqueda de la fecha en cada uno de los datos para recortarlos
data=cell(cantHidro,2);
for i=1:cantHidro
    cantArchi=length(paths{i});
    d=[];
    t=[];
    for j=1:cantArchi
        Info=extrae(paths{i}(j),center);
        Info=Info{1};
        [dt,tt]=cortar(Info,interseccion,center);
        d=[d;dt];
        t=[t;tt];
    end
    data{i,1}=d;
    data{i,2}=t;
end
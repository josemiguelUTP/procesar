%Test Script
%% Carga de RUTAS
carpeta='D:\Jevo\Documentos\Matematica aplicada\XM\Bases de datos\Prueba\DataMised\';
archivos={'Cerromatoso1','Cerromatoso2','Cerromatoso3','Cerromatoso4','Enea1','Enea2','Enea3','Guavio1','Guavio2','Guavio3','Guavio4'};
RUTAS=cell(length(archivos),1);
for i=1:length(archivos)
    RUTAS{i}=[carpeta,archivos{i},'.csv'];
end
%% Separacion de hidroelectricas
index=[1,5,8,12];
tic
[interseccion]=alinea(RUTAS,index);% t=5 min 55 seg
[~,dataCerromatoso]=alinea(RUTAS,index(1:2),interseccion);  %Datos de LaEnea2   t=1 min 57 seg
[~,dataEnea]=alinea(RUTAS,index(2:3),interseccion);         %Datos de GUAVIO2   t=2 min 21 seg
[~,dataGuavio]=alinea(RUTAS,index(3:4),interseccion);       %Datos de Cerro t=2 min 20 seg
toc
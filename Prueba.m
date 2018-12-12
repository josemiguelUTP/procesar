%Test Script
%% Carga de RUTAS
carpeta='D:\Jevo\Documentos\Matematica aplicada\XM\Bases de datos\Prueba\';
archivos={'Cerromatoso1','Cerromatoso2','Cerromatoso3','Cerromatoso4','Enea1','Enea2','Enea3','Guavio1','Guavio2','Guavio3','Guavio4'};
RUTAS=cell(length(archivos),1);
for i=1:length(archivos)
    RUTAS{i}=[carpeta,archivos{i},'.csv'];
end
%% Separacion de hidroelectricas
index=[1,5,8,12];
data=alinea(RUTAS,index);
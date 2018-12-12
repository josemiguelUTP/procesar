%Test Script con datos reales
%% Carga de RUTAS
carpeta='D:\Jevo\Documentos\Matematica aplicada\XM\Bases de datos\Prueba\';
%carpeta='D:\Jevo\Documentos\Matematica aplicada\XM\Bases de datos\';
%archivos={'C37118-2-GUAVIO2-20180812072823-20180814124232';'C37118-2-GUAVIO2-20180814124232-20180816175642';'C37118-2-GUAVIO2-20180816175642-20180817100930';'C37118-11-LaEnea230-20180812113629-20180814171847';'C37118-11-LaEnea230-20180814171847-20180816225234';'C37118-11-LaEnea230-20180816225234-20180817100930'};
archivos={'Cerromatoso1';'Cerromatoso2';'Cerromatoso3';'Cerromatoso4';'Enea1';'Enea2';'Enea3';'Guavio1';'Guavio2';'Guavio3';'Guavio4'};
RUTAS=cell(length(archivos),1);
for i=1:length(archivos)
    RUTAS{i}=[carpeta,archivos{i},'.csv'];
end
%% Separacion de hidroelectricas
index=[1,5,8,12];
data=alinea(RUTAS,index);%Prueba2

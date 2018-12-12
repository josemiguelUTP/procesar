function [ cach ] = cache( RUTA )
%cache procesa el archivo que se encuentra en RUTA y almacena esa
%informacion en un archivo binario con el mismo nombre
cach=importdata(RUTA,',');
cach1=cach.data;
cach2=cach.textdata;
index=strfind(RUTA,'/');
nombre1=[RUTA(index(end)+1:end-4),'-data','.mat'];
nombre2=[RUTA(index(end)+1:end-4),'-textdata','.mat'];
[~,~,~]=mkdir(RUTA(1:index(end)),'Cache');
carpeta=[RUTA(1:index(end)),'Cache/'];
save([carpeta,nombre1],'cach1');
save([carpeta,nombre2],'cach2');
end


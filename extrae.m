function [ Info ] = extrae( Path,Archivos,Extension )
%Almacena en un array de estructuras los datos almacenados en los archivos
%(Archivos.Extension) almacenados en (Path)
nArchivos=length(Archivos);
Info=struct('textdata',cell(1,nArchivos));
for i=1:nArchivos
    archivo=Archivos{i};
    Ruta=[Path,'\',archivo,Extension];
    temp=importdata(Ruta,',');
    %Solo se trabajará con la primera y ultima fila para ahorrar RAM
    Info(i).textdata=[temp.textdata(3,1:2);temp.textdata(end,1:2)];
end



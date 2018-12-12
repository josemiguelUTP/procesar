function [ datos ] = importdataC( RUTA )
%importdataC importa la informacion contenida en RUTA comprobando si hay
%una copia en cache dentro de la misma carpeta.
index=strfind(RUTA,'/');
nombre=RUTA(index(end)+1:end-4);
carpeta=RUTA(1:index(end));
d=dir(carpeta);
cached=false;
%Verifcicar que el archivo esta en cache
for i=1:length(d)
    name=d(i).name;
    if strcmp(name,'Cache')
        cacheC=[carpeta,'Cache/'];
        d=dir(cacheC);
        for j=1:length(d)
            if strcmp(nombre,d(j).name(1:end-4))
                cached=true;
            end
        end
        break;
    end
end
if cached
    load([cacheC,nombre,'.mat']);
    datos=cach;
else
    datos=cache([carpeta,nombre,'.csv']);
end
end
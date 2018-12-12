function [ m ] = concatData( Path,Archivos )
%Une en una sola matriz la informacion contenida en los archivos dentro de
%la carpeta Path organizados en orden cronológico
nArchivos=length(Archivos);
pivot=zeros(nArchivos,2); %pivot(i,1)=minFecha, pivot(i,2)=maxFecha del archivo i
dini=1;
for d=dini:nArchivos
    ruta=[Path Archivos{d}];
    Info=extrae(ruta);
    %Estructura de datos
    DN.Frecuency=Info.data(:,1);
    DN.PhasorVoltCHAM=Info.data(:,2);
    DN.PhasorVoltCHAA=Info.data(:,3);
    DN.PhasorVoltCHCM=Info.data(:,4);
    DN.PhasorVoltCHCA=Info.data(:,5);
    DN.PhasorVoltCHBM=Info.data(:,6);
    DN.PhasorVoltCHBA=Info.data(:,7);
    
end
end


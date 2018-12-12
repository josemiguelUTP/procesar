%Prueba de newtonRaphson
ruta={'D:\Jevo\Documentos\Matematica aplicada\XM\Bases de datos\Prueba\DataMised\Cerromatoso1.csv'};
center=18;
Info=extrae(ruta,center);
Info=Info{1};
%indice=15;
%Date=Info.textdata{indice,1};
%Time=Info.textdata{indice,2};
Date='17/08/18';
Time='8:30:17.900';
F=DateStr2U(Date,Time,center);
%% Despues del corte
%ruta={'D:\Jevo\Documentos\Matematica aplicada\XM\Bases de datos\Prueba\DataMised\Cerromatoso1.csv'};
%Info=extrae(ruta,center);
%Info=Info{1};
newtRaph(Info.textdata,F,center)
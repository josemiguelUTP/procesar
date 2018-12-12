%Test Script con datos reales
clear;
%% Carga de RUTAS
%carpeta='/home/gvilla/Downloads/PhPo/';
%carpeta='D:\Jevo\Documentos\Matematica aplicada\XM\Bases de datos\';
carpeta='D:\Jevo\Documentos\Matematica aplicada\XM\Bases de datos\Prueba\';
archivos={'Cerromatoso1','Cerromatoso2','Cerromatoso3','Cerromatoso4','Enea1','Enea2','Enea3','Guavio1','Guavio2','Guavio3','Guavio4'};
%archivos={'C37118-2-GUAVIO2-20180812072823-20180814124232';'C37118-2-GUAVIO2-20180814124232-20180816175642';'C37118-2-GUAVIO2-20180816175642-20180817100930';'C37118-11-LaEnea230-20180812113629-20180814171847';'C37118-11-LaEnea230-20180814171847-20180816225234';'C37118-11-LaEnea230-20180816225234-20180817100930'};
%archivos={'C37118-2-GUAVIO2-20180812072823-20180814124232'};
RUTAS=cell(length(archivos),1);
for i=1:length(archivos)
    RUTAS{i}=[carpeta,archivos{i},'.csv'];
end
clear carpeta archivos i
% RUTAS =
% {'/home/gvilla/Downloads/PhPo/C37118-11-LaEnea230-20180710001451-20180712061951.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-11-LaEnea230-20180712061951-20180714114336.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-11-LaEnea230-20180714114337-20180716171026.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-11-LaEnea230-20180716171026-20180718225234.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-11-LaEnea230-20180718225234-20180721040945.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-11-LaEnea230-20180721040945-20180723092544.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-11-LaEnea230-20180723092544-20180725144508.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-11-LaEnea230-20180725144508-20180727200153.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-11-LaEnea230-20180727200153-20180730011751.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-11-LaEnea230-20180730011751-20180801063806.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-11-LaEnea230-20180801063806-20180803123018.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-11-LaEnea230-20180803123018-20180805182513.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-11-LaEnea230-20180805182513-20180808001639.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-11-LaEnea230-20180808001640-20180810061422.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-11-LaEnea230-20180810061422-20180812113629.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-11-LaEnea230-20180812113629-20180814171847.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-11-LaEnea230-20180814171847-20180816225234.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-11-LaEnea230-20180816225234-20180817100930.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-2-GUAVIO2-20180701000000-20180703054335.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-2-GUAVIO2-20180703054335-20180705112709.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-2-GUAVIO2-20180705112709-20180707171036.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-2-GUAVIO2-20180707171036-20180709225411.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-2-GUAVIO2-20180709225411-20180712040928.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-2-GUAVIO2-20180712040928-20180714092328.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-2-GUAVIO2-20180714092328-20180716143714.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-2-GUAVIO2-20180716143714-20180718195220.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-2-GUAVIO2-20180718195220-20180721010640.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-2-GUAVIO2-20180721010640-20180723062052.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-2-GUAVIO2-20180723062052-20180725113553.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-2-GUAVIO2-20180725113553-20180727165007.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-2-GUAVIO2-20180727165007-20180729220412.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-2-GUAVIO2-20180729220413-20180801032014.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-2-GUAVIO2-20180801032014-20180803090356.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-2-GUAVIO2-20180803090356-20180805144743.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-2-GUAVIO2-20180805144743-20180807203149.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-2-GUAVIO2-20180807203149-20180810021414.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-2-GUAVIO2-20180810021414-20180812072823.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-2-GUAVIO2-20180812072823-20180814124232.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-2-GUAVIO2-20180814124232-20180816175642.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-2-GUAVIO2-20180816175642-20180817100930.csv';...
% % '/home/gvilla/Downloads/PhPo/C37118-40-IT Tctg
% 4904-20180701000000-20180704232005.csv';... %
% '/home/gvilla/Downloads/PhPo/C37118-40-IT Tctg
% 4904-20180704232005-20180708223700.csv';... %
% '/home/gvilla/Downloads/PhPo/C37118-40-IT Tctg
% 4904-20180708223700-20180712205001.csv';... %
% '/home/gvilla/Downloads/PhPo/C37118-40-IT Tctg
% 4904-20180712205001-20180716183448.csv';... %
% '/home/gvilla/Downloads/PhPo/C37118-40-IT Tctg
% 4904-20180716183448-20180720162002.csv';... %
% '/home/gvilla/Downloads/PhPo/C37118-40-IT Tctg
% 4904-20180720162002-20180724140358.csv';... %
% '/home/gvilla/Downloads/PhPo/C37118-40-IT Tctg
% 4904-20180724140358-20180728114745.csv';... %
% '/home/gvilla/Downloads/PhPo/C37118-40-IT Tctg
% 4904-20180728114745-20180801091053.csv';... %
% '/home/gvilla/Downloads/PhPo/C37118-40-IT Tctg
% 4904-20180801091053-20180805123403.csv';... %
% '/home/gvilla/Downloads/PhPo/C37118-40-IT Tctg
% 4904-20180805123403-20180809132736.csv';... %
% '/home/gvilla/Downloads/PhPo/C37118-40-IT Tctg
% 4904-20180809132736-20180813112146.csv';... %
% '/home/gvilla/Downloads/PhPo/C37118-40-IT Tctg
% 4904-20180813112146-20180817090740.csv';... %
% '/home/gvilla/Downloads/PhPo/C37118-40-IT Tctg
% 4904-20180817090740-20180817100930.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-44-Cerromatoso110_1-20180701000000-20180703045820.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-44-Cerromatoso110_1-20180703045820-20180705195558.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-44-Cerromatoso110_1-20180705195558-20180708053217.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-44-Cerromatoso110_1-20180708053218-20180710102514.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-44-Cerromatoso110_1-20180710102514-20180712145457.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-44-Cerromatoso110_1-20180712145457-20180714192451.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-44-Cerromatoso110_1-20180714192451-20180716235549.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-44-Cerromatoso110_1-20180716235549-20180719042628.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-44-Cerromatoso110_1-20180719042628-20180721085622.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-44-Cerromatoso110_1-20180721085622-20180723132541.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-44-Cerromatoso110_1-20180723132541-20180725175523.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-44-Cerromatoso110_1-20180725175523-20180727222523.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-44-Cerromatoso110_1-20180727222523-20180730025501.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-44-Cerromatoso110_1-20180730025501-20180801072913.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-44-Cerromatoso110_1-20180801072913-20180803122805.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-44-Cerromatoso110_1-20180803122805-20180805172652.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-44-Cerromatoso110_1-20180805172652-20180807222508.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-44-Cerromatoso110_1-20180807222508-20180810032226.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-44-Cerromatoso110_1-20180810032226-20180812075216.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-44-Cerromatoso110_1-20180812075216-20180814122252.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-44-Cerromatoso110_1-20180814122252-20180816165338.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-44-Cerromatoso110_1-20180816165338-20180817100930.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-51-Guavio_Caverna_U-20180701000000-20180704063730.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-51-Guavio_Caverna_U-20180704063730-20180706223547.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-51-Guavio_Caverna_U-20180706223547-20180709074453.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-51-Guavio_Caverna_U-20180709074454-20180711131816.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-51-Guavio_Caverna_U-20180711131816-20180713184236.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-51-Guavio_Caverna_U-20180713184236-20180716045139.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-51-Guavio_Caverna_U-20180716045139-20180718135709.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-51-Guavio_Caverna_U-20180718135709-20180720223736.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-51-Guavio_Caverna_U-20180720223736-20180723210307.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-51-Guavio_Caverna_U-20180723210307-20180726112517.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-51-Guavio_Caverna_U-20180726112517-20180728234510.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-51-Guavio_Caverna_U-20180728234510-20180731190026.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-51-Guavio_Caverna_U-20180731190026-20180803030826.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-51-Guavio_Caverna_U-20180803030826-20180805140027.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-51-Guavio_Caverna_U-20180805140027-20180807210406.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-51-Guavio_Caverna_U-20180807210406-20180810051526.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-51-Guavio_Caverna_U-20180810051526-20180812114335.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-51-Guavio_Caverna_U-20180812114335-20180814170746.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-51-Guavio_Caverna_U-20180814170747-20180817013855.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-51-Guavio_Caverna_U-20180817013855-20180817100930.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-60-Bacata-20180701000000-20180703065045.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-60-Bacata-20180703065045-20180705134124.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-60-Bacata-20180705134124-20180707203211.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-60-Bacata-20180707203211-20180710032158.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-60-Bacata-20180710032158-20180712094208.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-60-Bacata-20180712094208-20180714160208.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-60-Bacata-20180714160208-20180716222305.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-60-Bacata-20180716222305-20180719044334.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-60-Bacata-20180719044334-20180721110336.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-60-Bacata-20180721110336-20180723172339.csv';...
% '/home/gvilla/Downloads/PhPo/C37118-60-Bacata-20180723172339-20180725234428.csv'
% };
%% Estableciendo nombres de las fases y de archivos
nFase.fase0='fase0'; %Datos alineados en la misma ventana de tiempo
nFase.fase1='fase1'; %Patrones creados y limpiados
nFase.pFase1='frecuencias'; %Archivo .mat que contiene los patrones alineados y normalizados
nFase.sFase1='Norm'; %Sufijo del archivo que contiene la normalizacion de los patrones (pFase1_sFase1)
nFase.fase2='fase2'; %Clasificacion de patrones
nFase.fase3='fase3'; %Creacion de transiciones unicas
%% Deteccion de carpeta asumiendo que todos los archivos .csv estan en una misma carpeta
slash=strfind(RUTAS{1},'/');
if isempty(slash)
    slash=strfind(RUTAS{1},'\');
end
carpeta=RUTAS{1}(1:slash(end));
clear slash;
%% Fase 0 alineacion de hidroelectricas
%% Separacion de hidroelectricas
indice=[1,5,8,12];
hidr=length(indice)-1; %Cantidad de hidroelectricas
nombres=cell(hidr,1);
for i=1:hidr
    nombres{i}=['data',num2str(i)];
end
%% Se detecta la existencia de los datos de fase0
exis=true;
for i=1:hidr
    file=sprintf('data%d.mat',i);
    exis=exis&&exist([carpeta,'Datos Procesados\',nFase.fase0,'\',file],'file');
end
%% Si no existen se alinean las hidroelectricas
if ~exis
    %% Alineacion de hidroelectricas
    %Tiempo promedio para obtener la interseccion de los archivos de la ENEA2,
    %GUAVIO2 y CERROMATOSO es de 5 minutos con 55 segundos
    %Deteccion de la existencia de interseccion
    exis=exist([carpeta,'Datos Procesados\',nFase.fase0,'\','interseccion.mat'],'file');
    %Si no existe se crea
    if ~exis
        tic
        [interseccion]=alinea(18,RUTAS,indice);% t=5 min 55 seg
        toc
        %Guardando interseccion
        [~,~,~]=mkdir(carpeta,'Datos Procesados');
        [~,~,~]=mkdir([carpeta,'Datos Procesados\'],nFase.fase0);
        save([carpeta,'Datos Procesados\',nFase.fase0,'\','interseccion.mat'],'interseccion','-v7.3');
    end
    %Se carga interseccion siempre y cuando no est� en el workspace
    exis=exist('interseccion','var');
    if ~exis
        load([carpeta,'Datos Procesados\',nFase.fase0,'\','interseccion.mat']);
    end
    title='Alineando archivos';
    indent=0;
    prctg=0;
    % Creando la carpeta Datos Procesados y fase0 (Alineados)
    [~,~,~]=mkdir(carpeta,'Datos Procesados');
    [~,~,~]=mkdir([carpeta,'Datos Procesados\'],nFase.fase0);
    h=progress1(indent,title,0);
    for i=1:hidr
        name=nombres{i};
        tic;[~,data]=alinea(18,RUTAS,indice(i:i+1),interseccion);toc;
        %Quitando las fechas
        data=data{1};
        %% Guardando variables procesadas
        filename=[carpeta,'Datos Procesados\',nFase.fase0,'\',sprintf('data%d.mat',i)];
        save(filename,'data','-v7.3');
        h=progress1(indent,title,i/(length(indice)-1),h);
    end
end
%% Eliminacion de variables innecesarias
clear indice exis file i data
%% Creacion rutas de archivos de fase0
PATHS=cell(hidr,1);
for i=1:hidr
    PATHS{i}=[carpeta,'Datos Procesados\',nFase.fase0,'\',sprintf('data%d.mat',i)];
end
%% Fase 1 creacion limpieza y normalizacion de patrones
%% Se detecta la existencia de los datos de fase1
exis=exist([carpeta,'Datos Procesados\',nFase.fase1,'\',nFase.pFase1,'.mat'],'file');
exis=exis&&exist([carpeta,'Datos Procesados\',nFase.fase1,'\',nFase.pFase1,'_',nFase.sFase1,'.mat'],'file');

%Si no existen, se crean y guardan los patrones
if ~exis
    %% Creacion, limpieza y normalizacion de patrones
    %   Creacion
    [patrones,nanIndex]=crearP(PATHS,1,1);
    %   Limpieza
    ComPatrones=patrones; %Se almacenan los patrones sin limpiar
    patrones=clean(patrones,nanIndex);
    %   Normalizacion
    [patrones,N]=normaliza(patrones);
    %% Guardando variables procesadas
    %   Creando la carpeta fase1 (Patrones)
    [~,~,~]=mkdir(carpeta,'Datos Procesados');
    [~,~,~]=mkdir([carpeta,'Datos Procesados\'],nFase.fase1);
    save([carpeta,'Datos Procesados\',nFase.fase1,'\',nFase.pFase1,'.mat'],'patrones','-v7.3');
    save([carpeta,'Datos Procesados\',nFase.fase1,'\',nFase.pFase1,'_Completos.mat'],'ComPatrones','-v7.3');
    save([carpeta,'Datos Procesados\',nFase.fase1,'\',nFase.pFase1,'_nanIndex.mat'],'nanIndex','-v7.3');
    save([carpeta,'Datos Procesados\',nFase.fase1,'\',nFase.pFase1,'_',nFase.sFase1,'.mat'],'N','-v7.3');
    %% Eliminando variables innecesarias
    clear ComPatrones
end
%% Cargando variables de la fase1 siempre y cuando no est�n en el workspace
exis=exist('patrones','var');
if ~exis
    patrones=struct2array(load([carpeta,'Datos Procesados\',nFase.fase1,'\',nFase.pFase1,'.mat']));
end
%% Fase 2 clasificacion de los patrones
%% Se detecta la existencia de los datos de fase2
exis=exist([carpeta,'Datos Procesados\',nFase.fase2,'\',nFase.pFase1,'_centroides.mat'],'file');
exis=exis&&exist([carpeta,'Datos Procesados\',nFase.fase2,'\',nFase.pFase1,'_clasifica.mat'],'file');
%Si no existen se clasifican los patrones
if ~exis
    %% Creacion de centroides unicos y clasificacion de los patrones en estos centroides
    [ centroides,clasifica ] = centrUnicosO(patrones,0.5,0.7,50000);
    %% Guardando variables procesadas
    %   Creando la carpeta fase2 (Centroides y clasificacion)
    [~,~,~]=mkdir(carpeta,'Datos Procesados');
    [~,~,~]=mkdir([carpeta,'Datos Procesados\'],nFase.fase2);
    save([carpeta,'Datos Procesados\',nFase.fase2,'\',nFase.pFase1,'_centroides','.mat'],'centroides','-v7.3');
    save([carpeta,'Datos Procesados\',nFase.fase2,'\',nFase.pFase1,'_clasifica.mat'],'clasifica','-v7.3');
end
%% Cargando variables de la fase2 siempre y cuando ya no est�n en el workspace
exis=exist('centroides','var');
exis=exis&&exist('clasifica','var');
if ~exis
    centroides=struct2array(load([carpeta,'Datos Procesados\',nFase.fase2,'\',nFase.pFase1,'_centroides.mat']));
    clasifica=struct2array(load([carpeta,'Datos Procesados\',nFase.fase2,'\',nFase.pFase1,'_clasifica.mat']));
end
%% Se detecta la existencia de los datos de fase3
exis=exist([carpeta,'Datos Procesados\',nFase.fase3,'\',nFase.pFase1,'_transiciones','.mat'],'file');
%Si no existe entonces se crean las transiciones
if ~exis
    %% Fase 3 Creacion de transiciones unicas
    [ transiciones ] = transicionesUni( clasifica );
    %% Guardando variables procesadas
    %   Creando la carpeta fase3 (Transiciones unicas)
    [~,~,~]=mkdir(carpeta,'Datos Procesados');
    [~,~,~]=mkdir([carpeta,'Datos Procesados\'],nFase.fase3);
    save([carpeta,'Datos Procesados\',nFase.fase3,'\',nFase.pFase1,'_transiciones','.mat'],'transiciones','-v7.3');
end
%% Se cargan las variables de la fase3 siempre y cuando no existan en el workspace
exis=exist('transiciones','var');
if ~exis
    load([carpeta,'Datos Procesados\',nFase.fase3,'\',nFase.pFase1,'_transiciones','.mat']);
end
%% Prediccion
clear clasifica exis hidr i nombres PATHS patrones RUTAS;
%Se deben cargar los datos para hacer la prueba
load([carpeta,'Datos Procesados\',nFase.fase1,'\',nFase.pFase1,'_Completos.mat']);
load([carpeta,'Datos Procesados\',nFase.fase1,'\',nFase.pFase1,'_nanIndex.mat']);
[ ~,noNan,nanIndex1 ] = clean( ComPatrones,nanIndex );
ind=~(noNan==max(noNan));
noNan=noNan(ind);
nanIndex1=nanIndex1(ind);
mChunckIndex=find(noNan==max(noNan),1);
if mChunckIndex==1
    TestPatrones=ComPatrones(1:nanIndex1(mChunckIndex)-1,:);  
else 
    TestPatrones=ComPatrones(nanIndex1(mChunckIndex-1)+1:nanIndex1(mChunckIndex)-1,:);
end
[m,n]=size(TestPatrones);
for i=1:m
    actual=TestPatrones(i,:);
    if i>1
        %Clasificando
        centroide=clasificar(actual,centroides,0.5,0.7);
        %Encontrando probabilidades
        [ro,co]=find(transiciones);
        co=co(ro==centroide);
        ro=ro(ro==centroide);
    end
    plot(TestPatrones(1:i,1));
    pause(0.1);
    anterior=actual;
end
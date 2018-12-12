clear;close all
%% Inicializando variables
% Estableciendo nombres de las fases y de archivos
nFase.fase0='fase0'; %Datos alineados en la misma ventana de tiempo
nFase.fase1='fase1'; %Patrones creados y limpiados
nFase.pFase1='angulos'; %Archivo .mat que contiene los patrones alineados y normalizados
nFase.sFase1='Norm'; %Sufijo del archivo que contiene la normalizacion de los patrones (pFase1_sFase1)
nFase.fase2='fase2'; %Clasificacion de patrones
nFase.fase3='fase3'; %Creacion de transiciones unicas
sl='/';
carpeta=['Datos',sl];
C=10000;
%% Cargando datos de fase1
% Se detecta la existencia de los datos de fase1
exis=exist([carpeta,'Datos Procesados',sl,nFase.fase1,sl,nFase.pFase1,'.mat'],'file');
exis=exis&&exist([carpeta,'Datos Procesados',sl,nFase.fase1,sl,nFase.pFase1,'_',nFase.sFase1,'.mat'],'file');
%Si no existen se muestra un error
if ~exis
    error(sprintf('Los datos de los patrones no están donde se esperaba \n Por favor verifica que estan dentro de la carpeta Datos/Datos Procesados'));
else
    %Se cargan los datos de la fase1
    patrones=matfile([carpeta,'Datos Procesados',sl,nFase.fase1,sl,nFase.pFase1,'.mat']);
    nanIndex=struct2array(load([carpeta,'Datos Procesados',sl,nFase.fase1,sl,nFase.pFase1,'_nanIndex.mat']));
    load([carpeta,'Datos Procesados',sl,nFase.fase1,sl,nFase.pFase1,'_',nFase.sFase1,'.mat']);
    %% Cargando datos de fase2
    % Se detecta la existencia de los datos de fase2
    exis=exist([carpeta,'Datos Procesados',sl,nFase.fase2,sl,nFase.pFase1,'_centroides.mat'],'file');
    exis=exis&&exist([carpeta,'Datos Procesados',sl,nFase.fase2,sl,nFase.pFase1,'_clasifica.mat'],'file');
    %Si no existen se muestra un error
    if ~exis
        error('No se encuentran los datos de la clasificacion')
    else
        %Se cargan los datos de la fase2
        centroides=struct2array(load([carpeta,'Datos Procesados',sl,nFase.fase2,sl,nFase.pFase1,'_centroides.mat']));
        clasifica=matfile([carpeta,'Datos Procesados',sl,nFase.fase2,sl,nFase.pFase1,'_clasifica.mat']);
        %% Cargando datos de fase3
        % Se detecta la existencia de los datos de fase3
        exis=exist([carpeta,'Datos Procesados',sl,nFase.fase3,sl,nFase.pFase1,'_transiciones','.mat'],'file');
        if ~exis
            %Si no existe entonces se muestra un error
            error('No se encuentran las transiciones unicas')
        else
            %Se cargan los datos de la fase3
            load([carpeta,'Datos Procesados',sl,nFase.fase3,sl,nFase.pFase1,'_transiciones','.mat']);
            %% Graficas
            %[m,n]=size(patrones.patrones);
            %debug
            %Verificando la existencia de las variables tamano
            exis=exist(['Datos',sl,'Datos Procesados',sl,nFase.fase1,sl,nFase.pFase1,'_tamano.mat'],'file');
            if ~exis
                [m,n]=size(patrones.patrones);
                save(['Datos',sl,'Datos Procesados',sl,nFase.fase1,sl,nFase.pFase1,'_tamano.mat'],'m','n');
            end
            %Se carga el tamano de la matriz si no existe en el workspace
            exis=exist('m','var')&&exist('n','var');
            if ~exis
                load(['Datos',sl,'Datos Procesados',sl,nFase.fase1,sl,nFase.pFase1,'_tamano.mat']);
            end
            centroides=desNormaliza(centroides,N);
            %Se organiza las transiciones
            [~,ind]=sort(transiciones(:,3),'descend');
            transiciones=transiciones(ind,:);
            %Convirtiendo las ocurrencias en probabilidades
            T=sum(transiciones(:,3));
            %Graficando las 5 transiciones mas frecuentes y las 5
            %transiciones menos frecuentes
            %5 transiciones mas frecuentes
            top5=unique(transiciones(1:5,1:2));
            %5 transiciones menos frecuentes
            pot5=unique(transiciones(end-4:end,1:2));
            %Graficando los centroides que pertenecen a estas transiciones
            plot(centroides(top5,[1 3 5 7])','b');hold on;
            plot(centroides(pot5,[1 3 5 7])','r');hold off;
            title('5 mas frecuentes y 5 menos frecuentes');
            legend('Mas frecuentes','Menos frecuentes');
            xlabel('Hidroelectricas');
            ylabel('Frecuencia');
            figure(2);
            %% se cargan los primeros C datos de patrones y clasifica en
            %defParones y defClasifica
            pi=1;
            pf=C;
            chun=1;
            defPatrones=desNormaliza(patrones.patrones(pi:pf,:),N);
            defClasifica=clasifica.clasifica(pi:pf,1);
            header1=sprintf('Patron actual: %d',defClasifica(1));
            header2='';
            button=msgbox('Pausar?');
            Position=button.Position;
            for i=1:m-1
                if ~(i==nanIndex(i))
                    if i>pf
                        pi=pf+1;
                        pf=pi+C-1;
                        if pf>m-1
                            pf=m-1;
                        end
                        chun=chun+1;
                        defPatrones=desNormaliza(patrones.patrones(pi:pf,:),N);
                        defClasifica=clasifica.clasifica(pi:pf,1);
                    end
                    patron=defPatrones(i-(chun-1)*C,:);
                    clasif=defClasifica(i-(chun-1)*C,:);
                    actual=patron;
                    actualC=clasif;
                    % Tabla con posibles centroides siguientes
                    inActual=transiciones(:,1)==actualC;
                    posibles=double(transiciones(inActual,:));
                    posibles(:,3)=posibles(:,3)/T*100;
                    maxProbabilidad=max(posibles(:,3));
                    masProbable=posibles(posibles(:,3)==maxProbabilidad,2);
                    if i>1&&~(anteriorC==actualC)
                        %Encontrando probabilidades
                        indice=find(transiciones(:,1)==anteriorC&transiciones(:,2)==actualC);
                        if numel(indice)==0
                            probabilidadActual=0;
                        else
                            probabilidadActual=double(transiciones(indice,3))/T*100;
                        end
                        %Titulos
                        header2=sprintf('Patron anterior: %d',anteriorC);
                        header1=sprintf('Patron actual: %d %0.2f %%',actualC,probabilidadActual);
                    end
                    if i==1||~(anteriorC==actualC)
                        if ~ishandle(button)
                            button=msgbox('Continuar?');
                            button.Position=Position;
                            while ishandle(button)
                                pause(0.1);
                            end
                            button=msgbox('Pausar?');
                            button.Position=Position;
                        else
                            Position=button.Position;
                            pause(2);
                        end
                        %Mostrando posibles transiciones siguientes
                        head='Siguiente Probabilidad';
                        disp(header2);
                        disp(header1);
                        disp(head);
                        if size(posibles,1)>14
                            stri1=sprintf('\n%8d  %0.3f %%',posibles(1:5,2:3)');
                            stri2=sprintf('%8d  %0.3f %% \n',posibles(end-5:end,2:3)');
                            disp(stri1);
                            disp('         .            ');
                            disp('         .            ');
                            disp('         .            ');
                            disp(stri2);
                        else
                            stri=sprintf('%8d  %0.3f %% \n',posibles(:,2:3)');
                            disp(stri);
                        end
                        
                        
                        %Graficando resultados actuales
                        X=((1:i-(chun-1)*C)+(chun-1)*C)*0.1/60;
                        Xt=(pi:pf)*0.1/60;
                        Cxt=length(Xt);
                                               
                        Y1=defPatrones(1:i-(chun-1)*C,1:3);
                        Y1f=ones(Cxt,1)*centroides(masProbable,1:3);
                        Y3=defPatrones(1:i-(chun-1)*C,4:6);
                        Y3f=ones(Cxt,1)*centroides(masProbable,4:6);
                        Y5=defPatrones(1:i-(chun-1)*C,7:9);
                        Y5f=ones(Cxt,1)*centroides(masProbable,7:9);
                        Y7=defPatrones(1:i-(chun-1)*C,10:12);
                        Y7f=ones(Cxt,1)*centroides(masProbable,10:12);
                        subplot(4,1,1);
                        hold off;plot(X,Y1);hold on;
                        title('La Enea');
                        plot(Xt,Y1f);
                        ylim([110,130]);
                        xlim([Xt(1),Xt(end)]);
                        ylabel('Dif entre fases');
                        legend('A-B','B-C','C-A','Siguiente A-B','Siguiente B-C','Siguiente C-A');
                        subplot(4,1,2);
                        hold off;plot(X,Y3);hold on;
                        title('Guavio2');
                        ylabel('Dif entre fases');
                        plot(Xt,Y3f)
                        ylim([110,130]);
                        xlim([Xt(1),Xt(end)]);
                        legend('A-B','B-C','C-A','Siguiente A-B','Siguiente B-C','Siguiente C-A');
                        subplot(4,1,3);
                        hold off;plot(X,Y5);hold on;
                        title('Cerromatoso');
                        ylabel('Dif entre fases');
                        plot(Xt,Y5f);
                        ylim([110,130]);
                        xlim([Xt(1),Xt(end)]);
                        legend('A-B','B-C','C-A','Siguiente A-B','Siguiente B-C','Siguiente C-A');
                        subplot(4,1,4);
                        hold off;plot(X,Y7);hold on;
                        title('Guavio Caverna');
                        ylabel('Dif entre fases');
                        xlabel('Minutos');
                        plot(Xt,Y7f);
                        ylim([110,130]);
                        xlim([Xt(1),Xt(end)]);
                        legend('A-B','B-C','C-A','Siguiente A-B','Siguiente B-C','Siguiente C-A');
                    end
                    anterior=actual;
                    anteriorC=actualC;
                end
            end
        end
    end
end

function [ centroides,clasifica ] = centrUnicosO( data,mDis,mCor,C)
%[centroides,clasifica]=centrUnicos(data,dist,corr)
%   Entrega los centroides unicos y clasifica la matriz data donde el
%   numero indica el centroide al que pertenece el patron. data es una
%   matriz donde cada fila es un patron y las columnas son las variables.
%   mDis es la distancia euclidiana maxima a la que estara un centroide con
%   sus patrones y mCor es la correlacion minima que tendran los patrones
%   con su propio centroide optimizados para trabajar por bloques de a
%   C centroides unicos

%% Variables para ver el progreso del script
indent1=0;
title1='Creacion de centroides: ';

%indent2=1;
%title2='Verificacion de distancias: ';

modo='text';
%% Creacion de centroides �nicos
[N,d]=size(data); %N: Numero de observaciones, d:Dimension de los patrones
%El primer centroide siempre ser� el primer patron
h1=progress1(indent1,title1,0,modo);
centroides=zeros(N,d);
clasifica=zeros(N,1);
centroides(1,:)=data(1,:);
clasifica(1)=1;
cant=1;%Cantidad de centroides hasta ahora
h1=progress1(indent1,title1,1/N,h1,modo);
for i=2:N
    %Se verifica que el patron i este cerca de los centroides hallados
    %hasta ahora
    %Si la cantidad de centroides es mayor a C se comenzara a evaluar
    %por bloques de a C centroides
    if cant<=C
        dist=pdist(data(i,:),centroides(1:cant,:));
        corr=corrcoef(data(i,:),centroides(1:cant,:));
        cercano=(dist <= mDis  & corr >= mCor);
        %Busca el que sea cercano y si lo encuentra lo clasifica en el primer
        %centroide mas cercano
        j=find(cercano,1);
        if ~isempty(j)
            clasifica(i)=j;
        else %Quiere decir que el patron no es cercano a ningun centroide unico
            %Se a�ade a los centroides unicos y se clasifica al ultimo centroid
            %a�adido que es cant+1
            centroides(cant+1,:)=data(i,:);
            clasifica(i)=cant+1;
            cant=cant+1;
        end
    else
        %Calculo de cantidad de bloques
        chunk=ceil(cant/C);
        pI=1;
        pF=C;
        for j=1:chunk
            dist=pdist(data(i,:),centroides(pI:pF,:));
            corr=corrcoef(data(i,:),centroides(pI:pF,:));
            %Busca el que sea cercano y si lo encuentra lo clasifica en el primer
            %centroide mas cercano
            k=find(dist <= mDis  & corr >= mCor,1);
            cercano=~isempty(k);
            if cercano
                clasifica(i)=k;
                break;               
            end
            pI=pF+1;
            pF=pF+C;
            if pF>cant
                pF=cant;
            end
        end
        if ~cercano
            %Quiere decir que el patron no es cercano a ningun centroide unico del bloque j
            %Se a�ade a los centroides unicos y se clasifica al ultimo centroid
            %a�adido que es cant+1
            centroides(cant+1,:)=data(i,:);
            clasifica(i)=cant+1;
            cant=cant+1;
        end
    end
    
    h1=progress1(indent1,title1,i/N,h1,modo);
    if i==2
        t=tic;
        fprintf('Centroides hasta ahora: %d \n\n',cant);
        cantA=cant;
    elseif toc(t)>1&&~(cantA==cant)
        fprintf('Centroides hasta ahora: %d \n\n',cant);
        t=tic;
    end
    cantA=cant;
end
centroides=centroides(1:cant,:);
end

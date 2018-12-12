function [ data,textdata ] = cortar( Info,interseccion,center )
%cortar Entrega una matriz data con los valores numericos que est�n entre
%las fechas {interseccion(1),interseccion(2)} asi como las fechas de cada
%uno
%% Inicializacion de variables
fi=Str2U(Info.textdata(3,1),Info.textdata(3,2),center);
ff=Str2U(Info.textdata(end,1),Info.textdata(end,2),center);
i1=interseccion(1);
i2=interseccion(2);
data=0;
textdata=0;
%% Verificacion de los cuatro casos
if i1>=fi
    if i2<=ff
        %caso 1
        [ data,textdata ]=caso1(Info,interseccion,center);
    elseif i1<=ff
        %caso 2
        [ data,textdata ]=caso2(Info,interseccion,center);
    end
else
    if ~(i2<=ff)
        %Caso 4
        [ data,textdata ]=caso4(Info,interseccion,center);
    elseif i2>=fi
        %Caso 3
        [ data,textdata ]=caso3(Info,interseccion,center);
    end
end
if (i1>ff||i2<fi)
    %Caso 5
    [data,textdata] =caso5(Info,interseccion,center);
end
    function [data,textdata] =caso1(Info,interseccion,center)
        i1=interseccion(1);
        i2=interseccion(2);
        index1=newtRaph(Info.textdata,i1,center);
        index2=newtRaph(Info.textdata,i2,center);
        [data,textdata]=recorte(Info,index1,index2);
    end
    function [data,textdata] =caso2(Info,interseccion,center)
        i1=interseccion(1);
        index=newtRaph(Info.textdata,i1,center);
        [data,textdata]=recorteIZQ(Info,index);
    end
    function [data,textdata] =caso3(Info,interseccion,center)
        i2=interseccion(2);
        index=newtRaph(Info.textdata,i2,center);
        [data,textdata]=recorteDER(Info,index);
    end
    function [data,textdata] =caso4(Info,~,~)
        [data,textdata]=recorte(Info,3,length(Info.textdata));
    end
    function [data,textdata] =caso5(~,~,~)
        data=[];
        textdata=[];
    end
    function [data,textdata] = recorte(Info,indice1,indice2)
        %Recorte Recorta por la derecha la matriz Info.data desde indice1 hasta
        %indice2
        %   Detailed explanation goes here
        data=Info.data(indice1-2:indice2-2,:);
        textdata=Info.textdata(indice1:indice2,1:2);
    end
    function [data,textdata] = recorteDER(Info,indice)
        %RecorteDER Recorta por la derecha la matriz Info.data desde indice hasta
        %end
        %   Detailed explanation goes here
        data=Info.data(1:indice-2,:);
        textdata=Info.textdata(3:indice,1:2);
    end
    function [data,textdata] = recorteIZQ(Info,indice)
        %RecorteIZQ Recorta por la izquierda la matriz Info.data desde 1 hasta
        %indice
        %   Detailed explanation goes here
        data=Info.data;
        data=data(indice-2:end,:);
        textdata=Info.textdata;
        textdata=textdata(indice:end,1:2);
    end
end
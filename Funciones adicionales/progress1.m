function [ H ] = progress1( indent,title,prctg,varargin )
%Syntax:
%0)     prog(indent,title,prctg) Inicializa el waitbar
%1)     prog(indent,title,prctg,modo) Inicializa el waitbar y especifica si
%           el porcentaje se muestra en linea de comandos 'text' o en grafico 'graph'
%2)     prog(indent,title,prctg,Ha) Actualiza el progreso de la waitbar h
%       tarea actual que lleva un prctg% completado
%3)     prog(indent,title,prctg,Ha,modo) Igual que prog(indent,title,prctg,h)
%           pero especifica si el porcentage se muestra en linea de
%           comandos 'text' o en grafico 'graph'

%% Varargin parse
if nargin==3
    caso=0;
    tEst=0;
elseif nargin>=4
    if ischar(varargin{1})
        modo=varargin{1};
        caso=1;
    else
        Ha=varargin{1};
        caso=2;
        if nargin==5
            modo=varargin{2};
            caso=3;
        end
    end
end
%% Actualizacion de variables
H.tActual=tic;
H.prctg=prctg;
if caso==0||caso==1
    H.tMedio=0;
    H.cant=0;
elseif caso==2||caso==3
    H.cant=Ha.cant+1;
    H.tMedio=(Ha.tMedio*Ha.cant+toc(Ha.tActual))/H.cant;
    %Se calcula el tiempo estimado
    tEst=(1-H.prctg)/(H.prctg-Ha.prctg)*H.tMedio;
end
%% Si ha pasado menos de 1 segundo desde la ultima ejecucion no se imprime nada en pantalla
if caso>=2
if toc(Ha.tImpr)<1
    if caso==2||(caso==3&&strcmp(modo,'graph'))
        H.h=Ha.h;
        H.tImpr=Ha.tImpr;
    elseif caso==3&&strcmp(modo,'text')
        H.h=1;
        H.tImpr=Ha.tImpr;
    end
    return;
end
end
%% Impresion del progreso
H.tImpr=tic;
prctgR=round(prctg,5);
Position=[377.2500  259.8750-indent*56.2500  270.0000   56.2500];
if caso==0||(caso==1&&strcmp(modo,'graph'))
    H.h=waitbar(prctg,[title,num2str(prctgR*100),'%'],'Position',Position);
elseif caso==1&&strcmp(modo,'text')
    H.h=1;
    txt=[repmat(' ',1,4*indent),title,num2str(prctg*100),'%'];
    disp(txt);
elseif caso==2||(caso==3&&strcmp(modo,'graph'))
    H.h=graphPrint(Position,title,prctg,Ha.h,tEst);
elseif caso==3&&strcmp(modo,'text')
    H.h=Ha.h;
    txt=[repmat(' ',1,4*indent),title,num2str(prctg*100),'%'];
    disp(txt);
    txt=[repmat(' ',1,4*indent),'T estimado ',num2str(tEst),' segundos'];
    disp(txt);
end
end
function h=graphPrint(Position,title,prctg,h,tEst)
if ishandle(h)
    if prctg<1
        waitbar(prctg,h,[title,num2str(prctg*100),'% Tiempo estimado ',num2str(tEst),' segundos'],'Position',Position);
    else
        waitbar(prctg,h,[title,num2str(prctg*100),'% Tiempo estimado ',num2str(0),' segundos'],'Position',Position);
        close(h);
    end
else
    if prctg<1
        h=waitbar(prctg,[title,num2str(prctg*100),'% Tiempo estimado ',num2str(tEst),' segundos'],'Position',Position);
    else
        h=waitbar(prctg,[title,num2str(prctg*100),'% Tiempo estimado ',num2str(tEst),' segundos'],'Position',Position);
        close(h);
    end
end
end
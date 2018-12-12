function [ h ] = progress( indent,title,varargin )
%Syntax:
%       prog(indent,title,prctg) Inicializa el waitbar
%       prog(indent,title,h,prctg) Actualiza el progreso de la waitbar h 
%       tarea actual que lleva un prctg% completado

%Varargin parse
if nargin==3
    prctg=varargin{1};
    caso=0;
elseif nargin==4
    h=varargin{1};
    prctg=varargin{2};
    caso=1;
else
    error('Syntax error');
end
Position=[377.2500  259.8750-indent*56.2500  270.0000   56.2500];
switch caso
    case 0
        h=waitbar(prctg,[title,num2str(prctg*100),'%'],'Position',Position);
    case 1
        if ishandle(h)
            if prctg<1
                waitbar(prctg,h,[title,num2str(prctg*100),'%']);
            else
                waitbar(prctg,h,[title,num2str(prctg*100),'%']);
                close(h);
            end
        else
            if prctg<1
                h=waitbar(prctg,[title,num2str(prctg*100),'%'],'Position',Position);
            else
                h=waitbar(prctg,[title,num2str(prctg*100),'%'],'Position',Position);
                close(h);
            end
        end
end
end


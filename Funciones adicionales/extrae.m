function  varargout  = extrae( Path,center )
%Almacena en un array de estructuras los datos almacenados en los archivos
%(Archivos) almacenados en (Path)
%   Info=extrae(Path,center)
%   [Fechas,fechaInicial,fechaFinal]=extrae(Path,center)
%   [fechaInicial,fechaFinal]=extrae(Path,center)

nArchivos=length(Path);
Fechas=zeros(nArchivos,2);
Info=cell(nArchivos,1);
title='Extrayendo archivos:';
indent=1;
h=progress(indent,title,0);
for i=1:nArchivos
    prctg1=(i)/nArchivos;
    %archivo=Archivos{i};
    %Ruta=[Path,'\',archivo];
    Ruta=Path{i};
    temp=importdata(Ruta);
    if nargout==1
        Info{i}=temp;
    end
    %Solo se trabajar� con la primera y ultima fila
    fechaInicial=Str2U(temp.textdata(3,1),temp.textdata(3,2),center);
    fechaFinal=Str2U(temp.textdata(end,1),temp.textdata(end,2),center);
    if nargout==3
        Fechas(i,:)=[fechaInicial,fechaFinal];
    end
    h=progress(indent,title,h,prctg1);
end
fechaInicial=min(Fechas(:,1));
fechaFinal=max(Fechas(:,2));
if nargout==1
    varargout{1}=Info;
elseif nargout==2
    varargout{1}=fechaInicial;
    varargout{2}=fechaFinal;
elseif nargout==3
    varargout{1}=Fechas;
    varargout{2}=fechaInicial;
    varargout{3}=fechaFinal;
end
end
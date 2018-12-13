function [] = Comparar(data,epicenter,range,varargin)
%(1) [] = Comparar(data,epicenter):
%       grafica las columnas en data en diferentes
%       subplots range/2 muestras a la izquierda y range/2 muesrtas a la derecha
%       de epicenter
%(2) [] = Comparar(data,epicenter,title):
%       Igual que (1) pero agrega los titulos en title
%Varargin parse
if numel(varargin)==1
    titl=varargin{1};
else
    titl='';
end
[~,n]=size(data);
for i=1:n
    subplot(n,1,i);
    plot(data(epicenter-(floor(range/2)):epicenter+(ceil(range/2)),i));
    if ~isempty(titl)
        if length(titl)>=i
        title(titl{i});
        end
    end
end
end


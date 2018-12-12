function [ varargout ] = transicionesUni2( clasifica )
%[ transiciones ] = transicionesUni2( clasifica )
%   Crea una matriz dispersa mX2 con la estructura (patronAnt,patronSig) ocurrencias
%   que almacena la cantidad de ocurrencias en las que de un patronAnt pasa
%   a un patronSig en el vector clasifica
%[i,j,v]=transicionesUni2( clasifica )
%   Devuelve los indices para formar la matriz de transiciones unicas
%% Codigo
if numel(clasifica)>1
    dif=~(clasifica(1:end-1)==clasifica(2:end));
    dif(end+1)=dif(end);
    dif(2:end)=dif(2:end)|dif(1:end-1);
    clasifica=clasifica(dif);
    m=length(dif);
    clear dif;
    cant=0;
    K=zeros(m-1,1);
    L=zeros(m-1,1);
    v=zeros(m-1,1);
    title='Creando transiciones unicas ';
    indent=0;
    prctg=0;
    h=progress1(indent,title,prctg,'text');
    for i=2:length(clasifica)
        if ~(clasifica(i)==clasifica(i-1))
            repeti=K(1:cant+1)==clasifica(i-1)&L(1:cant+1)==clasifica(i);
            if ~repeti
                cant=cant+1;
                K(cant)=clasifica(i-1);
                L(cant)=clasifica(i);
                v(cant)=v(cant)+1;
            else
                index=find(repeti,1);
                v(index)=v(index)+1;
            end
        end
        
        h=progress1(indent,title,i/length(clasifica),h,'text');
        
    end
    K=K(1:cant);
    L=L(1:cant);
    v=v(1:cant);
    %% Varargout parse
    if nargout==1
        varargout{1}=sparse(K,L,v);
    elseif nargout==3
        varargout{1}=K;
        varargout{2}=L;
        varargout{3}=v;
    end
else
    %% Varargout parse
    if nargout==1
        varargout{1}=sparse(0);
    elseif nargout==3
        varargout{1}=[];
        varargout{2}=[];
        varargout{3}=[];
    end
end
end
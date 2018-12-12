function [j,k,l] = combinar(j,k,l,tj,tk,tl)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%Combinando indices (j,k) y ocurrencias (l)
if numel(tj)>0
    iRepet=zeros(size(tj,1),1);
    for p=1:size(tj,1)
        tem=find(tj(p,1)==j&tk(p,1)==k,1);
        if size(tem,1)>0
            iRepet(p)=tem;
        elseif size(tem,1)==0
            iRepet(p)=0;
        end
        if iRepet(p)>0
            l(iRepet(p))=l(iRepet(p))+tl(p);
        elseif iRepet(p)==0
            j=[j;tj(p,1)];
            k=[k;tk(p,1)];
            l=[l;tl(p,1)];
        end
    end
end
end


function [ iCentroide ] = clasificar( patron,centroides,mDis,mCor )
%[ iCentroide ] = clasifica( centroides,mDis,mCor ) Entrega el indice del
%centroide al que pertenece el patron entregado.
dist=pdist(patron,centroides);
corr=corrcoef(patron,centroides);
iCentroide=find((dist<=mDis&corr>=mCor),1);
if isempty(iCentroide)
    iCentroide=find(dist==min(dist),1);
end
end


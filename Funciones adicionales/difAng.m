function [dif] = difAng(ang1,ang2)
%Devuelve la diferencia angular entre ang1 y ang2 asumiendo que son angulos
%en grados 
dif1=abs(ang1-ang2);
dif2=abs(mod(ang2,360)-mod(ang1,360));
ind1=dif1<dif2;
ind2=~ind1;
dif(ind1)=ang1(ind1)-ang2(ind1);
dif(ind2)=mod(ang1(ind2),360)-mod(ang2(ind2),360);
end


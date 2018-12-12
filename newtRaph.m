function [x1] = newtRaph(textdata,F,center)
%newtRaph devuelve la posicion en la que se encuentra fecha F en textdata 
%   textdata es un cellarray que contiene las fechas en formato texto tal
%   como lo entrega importdata, y fecha es la fecha buscada  (Convertida
%   con la funcion DateStr2U
notFound=true;
x00=3;
x1a=0;
while notFound

fx00=DateStr2U(textdata(x00,1),textdata(x00,2),center);
fx01=DateStr2U(textdata(x00+1,1),textdata(x00+1,2),center);

df=fx01-fx00;
x1=round((F-fx00)/df)+x00;
if x1>size(textdata,1)
    x1=size(textdata,1);
end
if x1<3
    x1=0;
    return
end
fx1=DateStr2U(textdata(x1,1),textdata(x1,2),center);
notFound=~(fx1==F);
if x1a==x1&&notFound
    x1=0;
    notFound=~notFound;
end
x1a=x1;
x00=round((x1-x00)/2)+x00;
end
end


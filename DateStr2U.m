function [ U ] = DateStr2U( Date,Time,center)
%Convierte la fecha codificada en los datos de las UPM en U donde 1 Hora
%   son 36U donde el cero es center=[minYear minMes minDay minHor minMin
%minSec minDse]
if(~(length(center)==7))
    center=[center,zeros(1,7-length(center))];
end

Date=char(Date);
Time=char(Time);

Day=mStr2double(Date(:,1:2));
Month=mStr2double(Date(:,4:5));
Year=mStr2double(Date(:,7:8));

Hou=mStr2double(Time(:,1:2));
Min=mStr2double(Time(:,4:5));
Sec=mStr2double(Time(:,7:8));
Dse=mStr2double(Time(:,10));
U=(Day-center(3))*864+(Month-center(2))*26784+(Year-center(1))*321408+(Hou-center(4))*36+(Min-center(5))*0.6+(Sec-center(6))*0.01+(Dse-center(7))*0.001;
end


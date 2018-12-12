function [ U ] = DateStr2U( Date,Time,center)
%Convierte la fecha codificada en los datos de las UPM en U donde 1 Hora
%   son 36U donde el cero es center=[minDay minMes minYear minHor minMin
%minSec minDse]
if(~(length(center)==7))
    center=[center,zeros(1,7-length(center))];
end

Date=char(Date);
Time=char(Time);
slash=strfind(Date,'/');

Day=mStr2double(Date(:,1:slash(1)-1));
Month=mStr2double(Date(:,slash(1)+1:slash(2)-1));
Year=mStr2double(Date(:,slash(2)+1:end));

slash=strfind(Time,':');
Hou=mStr2double(Time(:,1:slash(1)-1));
Min=mStr2double(Time(:,slash(1)+1:slash(2)-1));
Sec=mStr2double(Time(:,slash(2)+1:end-4));
Dse=mStr2double(Time(:,end-2));
U=(Year-center(1))*321408+(Month-center(2))*26784+(Day-center(3))*864+(Hou-center(4))*36+(Min-center(5))*0.6+(Sec-center(6))*0.01+(Dse-center(7))*0.001;

end


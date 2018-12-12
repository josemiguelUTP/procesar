function [ U ] = Str2U(varargin)
%Convierte la fecha codificada en los datos de las UPM en U donde 1 Hora
%   Str2U( Date,Time,center) o Str2U( DateTime,center) o Str2U(DateTime)
%   Son 36U donde el cero es center=[minDay minMes minYear minHor minMin
%minSec minDse]
if nargin<=2
    DateTime=varargin{1};
    ind=strfind(DateTime,' ');
    Date=DateTime(1:ind-1);
    Time=DateTime(ind+1:end);
    if nargin==1
        center=0;
    else
        center=varargin{2};
    end
else
    Date=varargin{1};
    Time=varargin{2};
    center=varargin{3};
end
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
if length(slash)<2
    fprintf('Error en extraccion de hora, verifique el formato de hora del archivo');
else
    Hou=mStr2double(Time(:,1:slash(1)-1));
    Min=mStr2double(Time(:,slash(1)+1:slash(2)-1));
    Sec=mStr2double(Time(:,slash(2)+1:end-4));
end
point=strfind(Time,'.');
Dse=mStr2double(Time(:,point(1)+1));
U=(Year-center(1))*321408+(Month-center(2))*26784+(Day-center(3))*864+(Hou-center(4))*36+(Min-center(5))*0.6+(Sec-center(6))*0.01+(Dse-center(7))*0.001;
end
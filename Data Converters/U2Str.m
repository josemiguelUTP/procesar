function [DateTime,Date,Time,DateTimeVector] = U2Str(U,center)
%U2Str convierte una fecha en formato U a una cadena de texto
%   Detailed explanation goes here
if(~(length(center)==7))
    center=[center,zeros(1,7-length(center))];
end
Year=floor(U/321408);
Month=floor(mod(U,321408)/26784);
Day=floor(mod(U,26784)/864);

Hou=floor(mod(U,864)/36);
Min=floor(mod(U,36)/0.6);
Sec=floor(mod(U,0.6)/0.01);
Dse=round(mod(U,0.01)/0.001);

Year=Year+center(1);
Month=Month+center(2);
Day=Day+center(3);

Hou=Hou+center(4);
Min=Min+center(5);
Sec=Sec+center(6);
Dse=Dse+center(7);

DateTimeVector=[Year,Month,Day,Hou,Min,Sec,Dse];
Date={int2str(Day),'/',int2str(Month),'/',int2str(Year)};
temp=Date{1};
for i=2:5
    temp=[temp,Date{i}];
end
Date=temp;
Time={int2str(Hou),':',int2str(Min),':',int2str(Sec),'.',int2str(Dse),'00'};
temp=Time{1};
for i=2:8
    temp=[temp,Time{i}];
end
Time=temp;
DateTime=[Date,' ',Time];
end


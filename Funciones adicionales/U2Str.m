function [DateTime,Date,Time,DateTimeVector] = U2Str(U,center)
%U2Str convierte una fecha en formato U a una cadena de texto
%   Detailed explanation goes here
if(~(length(center)==7))
    center=[center,zeros(1,7-length(center))];
end
Years=round((U-mod(U,321408))/321408);
Months=round(mod((U-mod(U,26784)),321408)/26784);
Days=round(mod((U-mod(U,864)),26784)/864);

Hous=round(mod((U-mod(U,36)),864)/36);
Mins=round(mod(U-mod(U,0.6),36)/0.6);
Secs=round(mod(U-mod(U,0.01),0.6)/0.01);
Dses=round(mod(U,0.01)/0.001);

Years=Years+center(1);
Months=Months+center(2);
Days=Days+center(3);

Hous=Hous+center(4);
Mins=Mins+center(5);
Secs=Secs+center(6);
Dses=Dses+center(7);

[m,n]=size(U);
if m==1&&n==1
    i=1;
    j=1;
    Year=Years(i,j);Month=Months(i,j);Day=Days(i,j);
    Hou=Hous(i,j);Min=Mins(i,j);Sec=Secs(i,j);Dse=Dses(i,j);
    DateTimeVector=[Year,Month,Day,Hou,Min,Sec,Dse];
    Date=[int2str(Day),'/',int2str(Month),'/',int2str(Year)];
    Time=[int2str(Hou),':',int2str(Min),':',int2str(Sec),'.',int2str(Dse),'00'];
    DateTime=[Date,' ',Time];
else
    DateTimeVector=cell(m,n);
    Date=cell(m,n);
    Time=cell(m,n);
    DateTime=cell(m,n);
    for i=1:m
        for j=1:n
            Year=Years(i,j);Month=Months(i,j);Day=Days(i,j);
            Hou=Hous(i,j);Min=Mins(i,j);Sec=Secs(i,j);Dse=Dses(i,j);
            DateTimeVector{i,j}=[Year,Month,Day,Hou,Min,Sec,Dse];
            Date{i,j}=[int2str(Day),'/',int2str(Month),'/',int2str(Year)];
            Time{i,j}=[int2str(Hou),':',int2str(Min),':',int2str(Sec),'.',int2str(Dse),'00'];
            DateTime{i,j}=[Date{i,j},' ',Time{i,j}];
        end
    end
end
end
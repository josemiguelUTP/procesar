%parpool;
RUTAS={'C37118-51-Guavio_Caverna_U-20180817013855-20180817100930.csv'};
dini=1;
for d=dini:length(RUTAS)
    tic;
    ruta=RUTAS{d};
    indicesNAN=[];
    display(['iteracion',num2str(d)]);
    if exist(ruta,'file')==2
        Info=importdata(ruta,',');
        indicesNAN=find(isnan(Info.data(:,1)));
        if ~isempty(indicesNAN)
            Info.data(isnan(Info.data(:,1)),:)=[];
        end
    else
        break;
    end
    %Normalizando
    if d==1
        Nr.Fmean=mean(Info.data(:,1));
        Nr.Fmax=max(Info.data(:,1));
        Nr.VolAMmean=mean(Info.data(:,2));
        Nr.VolAMmax=max(Info.data(:,2));
        Nr.VolAAmean=mean(Info.data(:,3));
        Nr.VolAAmax=max (Info.data(:,3));
        Nr.VolBMmean=mean(Info.data(:,6));
        Nr.VolBMmax=max (Info.data(:,6));
        Nr.VolBAmean=mean(Info.data(:,7));
        Nr.VolBAmax=max (Info.data(:,7));
        Nr.VolCMmean=mean(Info.data(:,4));
        Nr.VolCMmax=max (Info.data(:,4));
        Nr.VolCAmean=mean(Info.data(:,5));
        Nr.VolCAmax=max (Info.data(:,5));
    end
    %DN.Time=DateStr2U(Info.textdata(3:end,1),Info.textdata(3:end,2),18,8,17,0,0,0,0);
    DN.Frecuency=(Info.data(:,1)-Nr.Fmean)./(Nr.Fmax-Nr.Fmean);
    DN.PhasorVoltCHAM=(Info.data(:,2)-Nr.VolAMmean)./(Nr.VolAMmax-Nr.VolAMmean);
    DN.PhasorVoltCHAA=(Info.data(:,3)-Nr.VolAAmean)./(Nr.VolAAmax-Nr.VolAAmean);
    DN.PhasorVoltCHCM=(Info.data(:,4)-Nr.VolCMmean)./(Nr.VolCMmax-Nr.VolCMmean);
    DN.PhasorVoltCHCA=(Info.data(:,5)-Nr.VolCAmean)./(Nr.VolCAmax-Nr.VolCAmean);
    DN.PhasorVoltCHBM=(Info.data(:,6)-Nr.VolBMmean)./(Nr.VolBMmax-Nr.VolBMmean);
    DN.PhasorVoltCHBA=(Info.data(:,7)-Nr.VolBAmean)./(Nr.VolBAmax-Nr.VolBAmean);
end
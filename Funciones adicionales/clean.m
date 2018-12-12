function [ data,noNan,nanIndex1 ] = clean( data,nanIndex )
%data=clean(data,nanIndex) entrega la maxima cantidad de datos posible sin
%valores NaN y la cantidad posible de filas contiguas sin valores nan 
l=length(nanIndex);
perfect=true;
i=1;
while i<=l&&perfect
    perfect=perfect&&(isempty(nanIndex{i}));
    i=i+1;
end
if perfect
    return;
else
    m=size(data,1);
    c=0;
    for i=1:l
        c=c+length(nanIndex{i});
    end
    nanIndex1=zeros(c,1);
    p1=1;
    p2=0;
    for i=1:c
        p2=p2+length(nanIndex{i});
        nanIndex1(p1:p2)=nanIndex{i};
        p1=p2+1;
    end
    nanIndex1(end+1)=m+1;
    nanIndex1=unique(nanIndex1);
    noNan=zeros(length(nanIndex1),1);
    noNan(1)=nanIndex1(1)-1;
    for i=2:length(noNan)
        noNan(i)=nanIndex1(i)-(nanIndex1(i-1)+1);
    end
    mChunckIndex=find(noNan==max(noNan),1);
    if mChunckIndex==1
    data=data(1:nanIndex1(mChunckIndex)-1,:);  
    else 
    data=data(nanIndex1(mChunckIndex-1)+1:nanIndex1(mChunckIndex)-1,:);
    end
end
end
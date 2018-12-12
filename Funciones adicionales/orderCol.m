function [order] = orderCol(posiciones,data)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
[m,n]=size(data);
order=zeros(m,n);
for i=1:length(posiciones)
    order(:,posiciones(i))=data(:,i);
end
end


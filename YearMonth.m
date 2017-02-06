function [ YM ] = YearMonth( date )
%   get YYYY/MM format from input  date
YM=cell(size(date,1),1);
dv=datevec(date);
for i=1:size(date,1)
ck=[int2str(dv(i,1)),'/',int2str(dv(i,2))];
%cc=strcat(int2str(dv(:,1)),'/',int2str(dv(:,2)));
YM(i)=cellstr(ck);
end
end


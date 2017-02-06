clear;clc;close all
[numG,txtG,rawG]=xlsread('data\LBMA-GOLD_After2003.xls');
dateG=txtG(2:end,1);
[numO,txtO,rawO]=xlsread('data\OPEC-ORB.xls');
dateO=txtO(2:end,1);
n=size(numO,1);
nG=size(numG,1);
date=cell(n,1);
values=NaN(n,2);
%match date
c=1;
for i=1:nG
    for j=1:n
        if ( isequal(dateG(i),dateO(j)))
            date(c,1)=dateG(i);
            values(c,1)=numO(j);% oil
            values(c,2)=numG(i,1);%gold
            c=c+1;
        end
    end
end
% trim NaN record
v=values(~isnan(values(:,1)),:);
date=date(~isnan(values(:,1)),:);
save('data.mat','date','v');




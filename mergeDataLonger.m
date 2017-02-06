clear;clc;close all
[LnumG,LtxtG,LrawG]=xlsread('data\LBMA-GOLD_After1983.xls');
LdateG=LtxtG(2:end,1);
[LnumO,LtxtO,LrawO]=xlsread('data\CHRIS-CME_CL1.xls');
LdateO=LtxtO(2:end,1);
n=size(LnumO,1);
nG=size(LnumG,1);
Ldate=cell(n,1);
Lvalues=NaN(n,2);
%match date
c=1;
for i=1:nG
    for j=1:n
        if ( isequal(LdateG(i),LdateO(j)))
            Ldate(c,1)=LdateG(i);
            Lvalues(c,1)=LnumO(j,6);% oil
            Lvalues(c,2)=LnumG(i,1);%gold
            c=c+1;
        end
    end
end
% trim NaN record
Lv=Lvalues(~isnan(Lvalues(:,1)),:);
Ldate=Ldate(~isnan(Lvalues(:,1)),:);
save('Ldata.mat','Ldate','Lv');




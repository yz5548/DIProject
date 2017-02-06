clear;clc;close all;
% [num,txt,raw]= xlsread('data\EIA-STEO_COUNPUS_M.xls');
% date=txt(2:end,1);
% dd=date(date>='2003-01-01' && date<='2017-02-02');

[num,txt,raw]=xlsread('data\MonthlyAverage.xlsx');
date=txt(2:end,1);
x=1:1:size(date,1);
ym=YearMonth(date);
[ax,h1,h2]=plotyy(x,num(:,2),x,num(:,1));
set(gca,'xlim', [1,170],'xtick', [1:6:170],'XTickLabel', ym(1:6:end),'XMinorTick','on')%,'XTickLabelRotation',90

set(ax(1),'ylim',[20,140],'ytick',[20:20:140]);  %left axis
set(ax(2),'ylim',[-0.6,0.6],'ytick',[-0.6:0.1:0.6]);  %right axis
legend([h1,h2],{'Crude Oil Pirce ($/Barrel)';'Supply-Demand (mb/d)'})
ylabel(ax(1),'Crude Oil Price');
ylabel(ax(2),'Supply - Demand');
title('Monthly crude oil price vs balance (supply - demand)')







clear;clc;close all
load('data.mat');
%date=d(:,1);
%v=d(:,2:3);
n=size(date,1);
x=1:1:n;

%ym=YearMonth(date);
[ax,h1,h2]=plotyy(x,v(:,1),x,v(:,2));
space=60;
set(ax(1),'xlim',[1,n],'xtick',[1:space:n],'XTickLabel', date(1:space:end),'XMinorTick','on','XTickLabelRotation',90)%,'XTickLabelRotation',90
set(ax(2),'xlim',[1,n],'xtick',[1:space:n],'XTickLabel', date(1:space:end),'XMinorTick','on','XTickLabelRotation',90)%,'XTickLabelRotation',90
set(ax(1),'ylim',[20,150],'ytick',[20:10:150]);  %left axis
set(ax(2),'ylim',[0,2000],'ytick',[0:100:2000]);  %right axis
legend([h1,h2],{'Crude Oil Pirce ($/Barrel)';'Gold Price ($/Ounce)'})
ylabel(ax(1),'Crude Oil Price');
ylabel(ax(2),'Gold Price');
title('Daily crude oil price vs gold price')
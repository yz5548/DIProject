% complet code https://github.com/yz5548/DIProject/tree/master/Q1
clear;clc;close all
% the expected group number f after each toss nth f(n)
% f(n+1)=(0.6*0.6+0.4*0.4)+(0.6*0.4*2)*(f(n)+1)
% f(1)=1,  so f(n)=0.48n+0.52

%What is the expected number of groups after 10 tosses?
a1=0.48*10+0.52;

%What is the expected number of groups after 500 tosses?
a2=0.48*500+0.52;

%What is the probability of (strictly) exceeding 6 groups after 10 tosses?
a3=(C(9,5)+C(9,6)+C(9,7)+C(9,8)+C(9,9))*2/(2^10);

%What is the probability of (strictly) exceeding 250 groups after 500 tosses?
a4=CC(500,250);
a4=vpa(a4,10);

%What is the probability of (strictly) exceeding 6 groups given we (strictly) 
% exceeded 5 groups after 10 tosses?
a5=CC(10,6)/CC(10,5);
a5=vpa(a5,10);

%What is the probability of (strictly) exceeding 250 groups given we 
% (strictly) exceeded 240 groups after 500 tosses?
a6=CC(500,250)/CC(500,240);
a6=vpa(a6,10);
%What is the probability of (strictly) exceeding 5 groups and (strictly) 
% exceeding 5 heads after 10 tosses?
p1=P(10,5);% exceeding 5 heads after 10 tosses
a7=CC(10,5)*p1;
a7=vpa(a7,10);
%What is the probability of (strictly) exceeding 100 groups and (strictly) 
% exceeding 100 heads after 200 tosses?
p2=P(200,100);% exceeding 100 heads after 200 tosses
a8=CC(200,100)*p2;
a8=vpa(a8,10);
a1,a2,a3,a4,a5,a6,a7,a8

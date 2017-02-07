clear; clc; close all;
%load cms.mat;
dirName='data2014\';
files = dir(dirName);
fileIndex = find(~[files.isdir]);
for i = 1:length(fileIndex)
fileName = files(fileIndex(i)).name;
eval(['load ' dirName fileName]);
end
clear dirName files fileIndex fileName i;
%{
In 2014, what was the average number of beneficiaries per provider? Due to 
the suppression of data for those with view beneficiaries, we can only include 
those with more than 10 beneficiaries.
%}
bc=nanmean(BENE_COUNT);
a1=vpa(bc,10)
%{
For each provider, estimate the length of the average prescription from the 
TOTAL_DAY_SUPPLY and TOTAL_CLAIM_COUNT. What is the median, in days, of the 
distribution of this value across all providers?
%}
supplyLen=TOTAL_DAY_SUPPLY./TOTAL_CLAIM_COUNT;
a2=median(supplyLen);
a2=vpa(a2,10)
%{ 
Q4
Find the ratio of beneficiaries with opioid prescriptions to beneficiaries 
with antibiotics prescriptions in each state. Assume that each beneficiary 
attends only a single provider. What is the difference between the largest 
and smallest ratios?
%}
N=size(NPPES_PROVIDER_STATE,1);
State=unique(NPPES_PROVIDER_STATE);%unique state list
n=size(State,1);
opioid=zeros(n,1);
antibi=zeros(n,1);
for i=1:N
    idx=find(strcmp(State,NPPES_PROVIDER_STATE(i)));
    if (~isnan(OPIOID_BENE_COUNT(i)))
        opioid(idx)=opioid(idx)+OPIOID_BENE_COUNT(i);
    end
    if (~isnan(ANTIBIOTIC_BENE_COUNT(i)))
        antibi(idx)=antibi(idx)+ANTIBIOTIC_BENE_COUNT(i);
    end
end
ratios=opioid./antibi;
a4=max(ratios)-min(ratios);
a4=vpa(a4,10)
%{ 
Q5
For each provider where the relevant columns are not suppressed, work out the 
fraction of claims for beneficiaries age 65 and older, as well as the fraction 
of claims for beneficiaries with a low-income subsidy. What is the Pearson 
correlation coefficient between these values?
%}
fage=TOTAL_CLAIM_COUNT_GE65./TOTAL_CLAIM_COUNT;
flow=LIS_CLAIM_COUNT./TOTAL_CLAIM_COUNT;
faIdx=find(~isnan(fage));
flIdx=find(~isnan(flow));
fcIdx=intersect(faIdx,flIdx);
[RHO,PVAL] = corr(fage(fcIdx),flow(fcIdx));
a5=vpa(RHO,10)

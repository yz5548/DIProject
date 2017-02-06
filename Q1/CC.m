function p = CC( a ,b )
% a: number of toss
% b: number of group

sum=0;

for i=b-1:a-1
    sum=sum+nchoosek(a-1,i);%nchoosek
end
p=sum*2/(2^a);


end


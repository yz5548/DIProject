function p = P( a ,b )
% a: number of toss in head
% b: number of group

sum=0;

for i=b:a
    sum=sum+nchoosek(a,i);%nchoosek
end
p=sum/(2^a);

end


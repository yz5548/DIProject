% probability formula 
%C(n,m)=A(n,m)/m!=n!/(m!*(n-m)!) 
%C(n,m)=C(n,n-m)
function n= C_test( a,b )
if (a<b) error('first parameter can''t be smaller than the second'); end

if (a==b)
    n=1;
    return
end

sum=a;
diff=a-b;
if (diff>a/2)
    b=a-b;
    diff=a-b;
end
ct=size(b,1);
%if diff<a/2
for i=a-1:-1:diff+1
    sum=sum*i;
    if (ct>=1)
        sum=sum/b(ct);
        ct=ct-1;
    end
end
%end
% for i=b:-1:1
%     sum=sum/i;
% end
n=sum;
return;

%n=factorial(a)/factorial(b)/factorial(a-b);

end


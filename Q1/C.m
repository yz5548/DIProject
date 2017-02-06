% probability formula 
%C(n,m)=A(n,m)/m!=n!/(m!*(n-m)!) 
%C(n,m)=C(n,n-m)
function n= C( a,b )
if (a<b) error('first parameter can''t be smaller than the second'); end

% if (a>100)
%     sum=a;
%     diff=a-b;
%     for i=a-1:-1:diff+1
%         sum=sum*i;
%     end
%     for i=b:-1:1
%         sum=sum/i;
%     end
%     n=sum;
%     return;
% end

if (a==b)
    n=1;
    return
end
n=factorial(a)/factorial(b)/factorial(a-b);

end


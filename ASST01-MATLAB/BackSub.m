function x=BackSub(U,b)
n=length(b);
x= zeros(n ,1);
x(n)=b(n)/U(n , n);
for i=n-1:-1:1
    if (U(i,i)==0) error('Matrix is singular!');
    end
    x(i)= (b(i) - U(i , i+1:end) * x(i + 1:end)) / U(i , i);
end


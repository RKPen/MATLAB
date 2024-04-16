% kgm07_asst01.m

%Exercise 1


% 1: Fibonacci number calculation
function result = Fibo1(n)
    if n == 1 || n == 2
        result = 1;
    else
        result = Fibo1(n - 1) + Fibo1(n - 2);
    end
end

% 2: Finding n0 such that Fn0 < N and Fn0+1 > N
function n0 = Fibo2(N)
    F0 = 0;
    F1 = 1;
    F2 = 1;
    n0 = 2;
    
    while F2 <= N
        F0 = F1;
        F1 = F2;
        F2 = F1 + F0;
        n0 = n0 + 1;
    end
end

% 3: Sum of the first 40 Fibonacci numbers divisible by 2 or 5
function fibsum = Fibsumdiv()
fibsum = 0
count = 0;

for n = 1:40
    fib_n = Fibo1(n);
    
    if mod(fib_n, 2) == 0 || mod(fib_n, 5) == 0
        fibsum = fibsum + fib_n;
        count = count + 1;
    end
end

fprintf('Sum of the first 40 Fibonacci numbers divisible by 2 or 5: %d\n', fibsum);
fprintf('Number of terms included in the sum: %d\n', count);
end


%Exercise 2


function x=float(b,e,p)
    x=[];
    eps=b^(-p);
    emin=1 - (2^(e-1) - 1);
    emax=2^(e-1);
    max=1-eps;
    for i=1:p
        max= max + b^(-i);
    end
    for e=emin:emax
        for i=0:eps:max
            y= b^e * (1 + i);
            x=[x , y];
        end
    end
    x=[0 x];
end


%Exercise 3: 


function x=BackSub(U,b)
n=length(b);
x= zeros(n ,1);
x(n)=b(n)/U(n , n);
for i=n-1:-1:1
    if (U(i,i)==0) error('Matrix is singular!');
    end
    x(i)= (b(i) - U(i , i+1:end) * x(i + 1:end)) / U(i , i);
end


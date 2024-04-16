function result = Fibo1(n)
    if n == 1 || n == 2
        result = 1;
    else
        result = Fibo1(n - 1) + Fibo1(n - 2);
    end
end
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

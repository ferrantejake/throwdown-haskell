-- Returns the specified Fibonacci number
fib :: Integer -> Integer
fib 0 = 1
fib 1 = 1
fib n = fib (n-1) + fib (n-2)


-- Returns the sequence up to the specified Fibonacci number
-- fibSequence :: Integer -> [Integer]
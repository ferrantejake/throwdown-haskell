module Hailstone where

-- Classic Hailstone problem
h :: Integer -> Integer
h n = if odd n
        then 3*n+1
        else n `div` 2

-- x : f x : f (f x) : f(f (f x)) : ...
iterate' :: (a -> a) -> a -> [a]
iterate' f x = x : iterate' f (f x)

trajectory :: Integer -> [Integer]
trajectory n = iterate' h n

-- Takes the first n elements of a list until there is a 
-- match 
takeUntil :: (a -> Bool) -> [a] -> [a]
takeUntil pred [] = error "Can't takeUntil on an empty list!"
takeUntil pred (x:xs) = if pred x
                        then [x]
                        else x: (takeUntil pred xs)

trajectoryTo1 :: Integer -> [Integer]
trajectoryTo1 n = takeUntil (==1) (trajectory n)

generateTrials :: Integer -> [Integer]
generateTrials n = takeUntil (==1) (trajectory n)

stoppingTime :: Integer -> Int
stoppingTime n = length (trajectoryTo1 n)

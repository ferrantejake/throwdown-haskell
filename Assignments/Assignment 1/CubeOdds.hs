-- Jake Ferrante
-- University of Central Florida
-- Programming Languages

-- Recursive implementation
cubeOdds :: [Integer] -> [Integer]
cubeOdds [] = []
-- cubeOdds (x:[]) = [x]
cubeOdds (x:xs) = if odd x
                then (x^3):(cubeOdds xs)
                else x:(cubeOdds xs)

-- List comprehension implementation
cubeOdds_comp :: [Integer] -> [Integer]
cubeOdds_comp (x:xs) = [if odd x then x ^ 3 else x | x <- xs]
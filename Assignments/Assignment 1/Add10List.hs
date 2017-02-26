-- Jake Ferrante
-- University of Central Florida
-- Programming Languages

-- List comprehension implementation
add10_list_comp :: [Integer] -> [Integer]
add10_list_comp xs = [x + 10 | x <- xs]

-- Recursive implementation
add10_list_rec :: [Integer] -> [Integer]
add10_list_rec [] = []
add10_list_rec (x:xs) = (x+10):(add10_list_rec xs)
-- Display length of list
length' xs = sum [1 | _ <- xs]

-- Remove uppercc
removeUpperCase xs = [x | x <- xs, elem x ['a'..'z']]

-- For all x in 1..oo
-- Numbers who are divisible by 6
multiplesOf6 = [x | x <- [1..], (mod x 6) == 0]

-- Return true if element is in list; break immediately
isInList :: (Eq a) => a -> [a] -> Bool
isInList a [] = False
isInList a (b:bs) = if a == b
                        then True
                        else isInList a bs

-- filterOddIndex xs = [x | x <- xs, (mod (indexOf x xs) 2) == 1]

-- indexOf :: Ord a => a -> [a] -> a
-- indexOf a ([]) = error "Element not in list!"
-- indexOf a (b:bs) = if a == b
--                     then 
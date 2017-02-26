-- Jake Ferrante
-- University of Central Florida
-- Programming Languages

deleteNth :: (Eq a) => Int -> a -> [a] -> [a]
-- If input is an empty list, return an empty list regardless of x, y input.
deleteNth _ _ [] = []
deleteNth 0 y xs = xs
-- If x == 1, then delete element if match, otherwise skip over and continue
deleteNth 1 y (z:zs) = if y == z then xs
                        else x : deleteNth 1 y zs
-- If x > 1, then if a match, decrement x and continue without altering the list
-- Otherwise if no match, continue with altering the list
deleteNth x y (z:zs) = if y == z then x : deleteNth (x-1) y xs
                        else x : deleteNth x y xs

deleteNth_comp :: (Eq a) => Int -> a -> [a] -> [a]
deleteNth_comp _ _ [] = []
deleteNth_comp 0 _ xs = xs
deleteNth_comp x y z = 
                        do
                            n <- n
                            if n = y 
                                then if x  
                                else []

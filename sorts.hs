-- Merge Sort
mergesort :: (Ord a) => [a] -> [a]
mergesort [] = []
mergesort (x:[]) = [x]
mergesort xs = merge a b
               where (a, b) = splitAt n xs
                     n = div (length xs) 2

merge :: (Ord a) => [a] -> [a] -> [a]
merge [] ys = ys
merge xs [] = xs
merge (x:xs) (y:ys) = if x < y
                        then x : (merge xs (y:ys))
                        else y : (merge (x:xs) ys)

mergeSort :: (Ord a) => [a] -> [a]
mergeSort xs = if (l < 2)
                 then xs
                 else merge h t
               where l = length xs
                     n = l `div` 2
                     s = splitAt n xs
                     h = mergeSort (fst s)
                     t = mergeSort (snd s)

-- Bubble Sort
bsort :: Ord a => [a] -> [a]
bsort s = case _bsort s of
               t | t == s    -> t
                 | otherwise -> bsort t
  where _bsort (x:x2:xs) | x > x2    = x2:(_bsort (x:xs))
                         | otherwise = x:(_bsort (x2:xs))
        _bsort s = s
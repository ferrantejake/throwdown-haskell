data NonEmptyList a = Sing a | a :# (NonEmptyList a)
    deriving Show

-- Takes in a non-empty-list of A's and returns the max
-- element of a
maxl :: (Ord a) => (NonEmptyList a) -> a
-- Single element
-- maxl (Sing a) = a
-- -- More than 1 element
-- maxl (a :# (b :# lst)) = if a > b
--     then maxl (a:# lst)
--     else maxl (b:# lst)

maxl (Sing a) = a
maxl (x :# y) = max x (maxl y) 
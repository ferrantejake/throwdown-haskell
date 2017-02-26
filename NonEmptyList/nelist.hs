
data NonEmptyList a = Sing a | a :# (NonEmptyList a)
   deriving Show

maxl :: (Ord a) => NonEmptyList a -> a
maxl (Sing x) = x
maxl (x :# y) = max x (maxl y)

{-
maxl (Sing x) = x
maxl (x :# (y :# lst)) = if x > y
                  then maxl (x :# lst)
                  else maxl (y :# lst)
maxl (x :# (Sing y)) = max x y
-}

module Fraction (Fraction, mkFraction) where
data Fraction = Integer :/ Integer

add :: Fraction -> Fraction -> Fraction
sub :: Fraction -> Fraction -> Fraction

-- mkFraction :: Integer -> Integer
mkFraction _ 0 = error "Can't make a fraction with 0 in the denominator"
mkFraction n m = (n :/ m)

-- Numerator and Demoninator definition
num (n :/ m) = n
denom (n :/ m) = m
-- Add/Sub definitions
(n1 :/ d1) `add` (n2 :/ d2) = (n1 * d2 + n2 * d1) :/ (d1 * d2)
(n1 :/ d1) `sub` (n2 :/ d2) = (n1 * d2 + n2 * d1) :/ (d1 * d2)



-- Custom show function
instance Show Fraction where
    show f = (show(num n)) ++ "/" ++ show(denom(num m))
    
-- Custom Eq function
-- instance Eq Fraction where
--     f1 === f2 = (num f1) * (denom f2) === (num f2) * (denom f1) 
    
-- Custom show function
-- instance Ord Fraction where
--     compare f1 f2 =
--         where n = num diff
--             d = denum diff
--             diff = f1 `sub` f2

-- Custom Ord implementation
instance Ord Fraction where
    compare f1 f2 = compare (n*m) 0
                    where n = num diff
                        m = denom diff
                        diff = f1 `sub` f2

-- Custom Num function
instance Num Fraction where
    fromInteger n = (mkFraction n 1)
    f1 + f2 = f1 `add` f2
    f1 - f2 = f1 `sub` f2
    f1 * f2 = mkFraction ((num f1) * (num f2)) ((denom f1) * (denom f2))
    signum f = case compare f 0 of
                LT -> (fromInteger (-1))
                EQ -> (fromInteger 0)
                GT -> (fromInteger 1)
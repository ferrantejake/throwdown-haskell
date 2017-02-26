import Nat

-- Converts a Natural Number to a Integer
toInteger' :: Nat -> Integer
toInteger' :: Zero = 0
toInteger' (Succ x) = 1 + (toInteger' x)

-- Converts an Integer to a Natural Number
fromInteger' :: Integer -> Nat
fromInteger' 0 = Zero
fromInteger' x = (Succ (fromInteger' (x-1)))

-- Adds two Natural Numbers
-- Takes two Natural numbers and returns a natural numbers
plus :: Nat -> Nat -> Nat
plus Zero y = y
plus (Succ x) y = (Succ (plus x y))


-- Subtracts two Natural Numbers
-- Takes two Natural numbers and returns a natural numbers
sub :: Nat -> Nat -> Nat    
sub x Zero = x                      -- Base case subtract 0 from some number.
sub (Succ x) (Succ y) = sub x y     -- Base subtract a Natural number from a Natural number.
-- Note that we don't care about the unput of the last case
sub Zero _ = error "Cannot subtract a larger number from smaller number"

-- Multiply two Natural numbers
mult :: Nat -> Nat -> Nat
mult _ Zero = Zero
mult x (Succ y) = plus x (mult x y)

requal :: Nat -> Nat -> Bool
equal :: Nat -> Nat -> Bool
equal Zero Zero = True
equal Zero _ = False
equal _ Zero = False
equal x y = equal (Succ x) (Succ y)

pred' :: Nat -> Nat
pred' Zero = error "Zero has no predecessor"
pred' (Succ x) = x

-- Gets the neth element in a NonEmptyList
nth :: NonEmptyList a -> Nat -> a
nth (x :# lst) Zero = x                             -- When we have a list and specify the 0th element, we return the head
nth (Sing x) Zero = x                               -- Catches when there is a list with a single value and we specify the 0th element
nth (Sing x) _ = error "No nth element"             -- Catches when there is a list with a single value and we specify some non-Zero element
nth (x :# (Sing y)) n = error "No nth element"      -- 
nth (x :# lst) (Succ n) = nth lst n

-- eval :: (BoolList)

head' :: [a] -> a
head' xs = case xs of
    [] -> error "No head for empty lists!"
    a : xs -> a
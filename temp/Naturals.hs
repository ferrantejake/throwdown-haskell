import Nat

toInteger' :: Nat -> Integer
toInteger' Zero = 0
toInteger' (Succ x) = 1 + (toInteger' x)

fromInteger' :: Integer -> Nat
fromInteger' 0 = Zero
fromInteger' x = (Succ (fromInteger' (x-1)))

plus :: Nat -> Nat -> Nat
plus Zero y = y
plus (Succ x) y = (Succ (plus x y))

sub :: Nat -> Nat -> Nat
sub x Zero = x
sub (Succ x) (Succ y) = sub x y 
sub Zero _ = error "Cannot subtract a larger number from a smaller one"

mult :: Nat -> Nat -> Nat
mult _ Zero = Zero
mult x (Succ y) = plus x (mult x y)

equal :: Nat -> Nat -> Bool
equal Zero Zero = True
equal Zero _ = False
equal _ Zero = False
equal x y = equal (Succ x) (Succ y)

pred' :: Nat -> Nat
pred' Zero = error "Zero has no predisessszzsor"
pred' (Succ x) = x


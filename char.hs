-- Takes a funciton and applies it to the char value
-- by casting the char to an int, applying the function
-- and casting back to an int.
-- Examples
-- > applyToChar (+3) 'a' == 'd'
-- > applyToChar (+1) 'b' == 'c'
-- > applyToChar (+7) 'a' == 'h'

applyToChar :: (Int -> Int) -> (Char -> Char)
applyToChar f c = toEnum (f (fromEnum c)) :: Char

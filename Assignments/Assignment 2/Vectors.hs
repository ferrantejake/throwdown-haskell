-- $Id: Vectors.hs,v 1.1 2015/01/21 21:50:41 leavens Exp leavens $
module Vectors where

-- Vectors are represented by finite lists of coordinate values.
type Vector = [Double]
-- dot :: Vector -> Vector -> Double

-- scale returns the Vector with each coordinate multiplied by the Double
scale :: Double -> Vector -> Vector
scale d (xs) = [x * d | x <- xs]

-- add returns a Vector that is the pointwise sum of the two arguments
-- The two arguments are assumed to have the same length.
add :: Vector -> Vector -> Vector
add [] [] = []
add (x:xs) (y:xy) = (x + y): add xs xy

-- dot returns the dot product of the Vector arguments
-- The two arguments are assumed to have the same length.
dot :: Vector -> Vector -> Vector
dot [] [] = []
dot (x:xs) (y:xy) = (x * y): dot xs xy

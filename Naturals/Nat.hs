module Nat where
-- Data probably means declaring a new data type
-- This declares the Natural numbers as a data type
data Nat = Zero | Succ Nat deriving (Eq, Show)
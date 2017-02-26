-- $Id: BinaryRelation.hs,v 1.2 2015/01/21 20:31:14 leavens Exp leavens $
module BinaryRelation where
-- Binary relations are represented as lists of pairs
type BinaryRelation a b = [(a,b)]


-- Projects a binary relation on its first column. That is,
-- it returns a list of all the keys of the relation
-- (in their original order)
project1 :: (BinaryRelation a b) -> [a]
project1 br = [a | (a, b) <- br]


-- Projects a binary relation on its second column. That is,
-- it returns a list of all the values of the relation 
-- (in their original order). (Note that the resulting list
-- may have duplicates even if the original relation had no
-- duplicate tuples.
project2 :: (BinaryRelation a b) -> [b] 
project2 br = [b | (a, b) <- br]


-- Takes a predicate and a binary relation and returns a list
-- of all the tuples in the relation that satisfy the predicate 
-- (in their original order). Note that the predicate is a 
-- function that takes a single pair as an argument. For those
-- pairs for which it returns True, the select function should
-- include that pair in the result
select :: ((a,b) -> Bool) -> (BinaryRelation a b) -> (BinaryRelation a b)
select filter pairs = [ (x, y) | (x, y) <- pairs, filter (x, y)]
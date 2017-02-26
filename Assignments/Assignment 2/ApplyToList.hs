module ApplyToList (
    applyRel,
    applyToList 
    ) where

import BinaryRelation


-- When given a key value, ky, of some equality type k, 
-- and a BinaryRelation pairs, of type (BinaryRelation k v)
-- the result is a list of values (of type v) that are the
-- values from all the pairs whose key is ky. Note that 
-- values in the result appear in the order in which they
-- appear in pairs.
applyRel :: (Eq k) => k -> (BinaryRelation k v ) -> [v]
-- for all (k, v) in the provided list, add to the result
-- if the key is equal to the provided ky.
applyRel ky binRelList = [v | (k,v) <- binRelList, k == ky]


-- When given a list of keys, keys, of some equality type k,
-- and a BinaryRelation, pairs, the result is a list of values
-- from all pairs in the relation pairs whose key is one of the
-- keys in keys. Note that the order of the answer is such that
-- all the values associated with the key in keys appear before
-- any of the values associated with a later key, and similarly
-- the values associated with other keys appear before later
-- keys in keys. (Hint: You may use applyRel in your solution
-- for this problem.)
applyToList :: (Eq k) => [k] -> (BinaryRelation k v) -> [v]
-- if the current key matches, the continue on the rest of the pairs
-- if the pair key does not match, exhaust all of the alternative keys
-- if the keys run out, move on to the next pair key

-- If the key set is empty, then there is nothing to compare to, 
-- thus we can not assert equality. Return an empty set.
applyToList [] _ = []

-- If we have run out of pairs, then there is nothing to compare.
-- Thus we can not assery equality for an undefined item. Return 
-- an empty set.
applyToList _ [] = []

-- If there is one key left, then check if it is equal. If it is, 
-- return the pair's value. Otherwise, return an empty list.
applyToList (key:[]) ((pkey, pval):pairset) =
    if key == pkey
    then pval:[]
    else []

-- If there are more than one keys left, compare to the currently
-- selected pair key. If they are equal, then move onto the next
-- pair key. Otherwise, check the pair key against all other keys,
-- as well recurse the pair keys that follow.
applyToList keyset@(key:keysettail) pairset@(pair@(pkey, pval):pairsettail) =
    if (pkey == key)
    then pval : (applyToList keyset pairsettail)
    else (applyToList keysettail pairset)
    
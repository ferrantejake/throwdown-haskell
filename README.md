# Haskell Throwdown
A collection of resources, probably bad code, and thoughts on Haskell

## Useful resources
[http://zvon.org/other/haskell/Outputprelude](http://zvon.org/other/haskell/Outputprelude)

## Useful functions you should probably know by now (in no particular order)
name                type                                    description
- abs               (Num a) => a -> a                       returns the absolute value of a number    
- sum               [a] -> [a]                              sums the values of 
- zip               [a] -> [b] -> [(a,b)]                   creates a list of tuples from two lists with respect to index location
- zipWith           (a -> b -> c) -> [a] -> [b] -> [c]      a in [a] and b in [b] across f = c in [c]
- maximum           (Ord a) => [a] -> a                     retuns the max element in an ordered list
- map               (a -> b) -> [a] -> [b]                  a of [a] across f = b of [b]
-- $Id: VectorsTests.hs,v 1.1 2015/01/21 18:43:36 leavens Exp $
module VectorsTests where
import Testing
import FloatTesting
import Vectors  -- you have to put your solutions in module Vectors
version = "VectorsTests $Revision: 1.1 $"
-- do main to run our tests
main :: IO()
main = do startTesting version
          errs_scale <- run_test_list 0 scale_tests
          errs_add <- run_test_list errs_scale add_tests
          total_errs <- run_test_list errs_add dot_tests
          doneTesting total_errs
-- The following will test one function each
test_scale, test_add, test_dot :: IO()
test_scale = dotests "Testing scale $Revision: 1.1 $" scale_tests 
test_add = dotests "Testing add $Revision: 1.1 $" add_tests 
test_dot = dotests "Testing dot $Revision: 1.1 $" dot_tests 

scale_tests :: [TestCase Vector]
scale_tests = 
    [(vecWithin (scale 3.14 []) "~=~" [])
    ,(vecWithin (scale 10.0 [1.0, 2.0, 4.0]) "~=~" [10.0, 20.0, 40.0])
    ,(vecWithin (scale 5.3 [1.0 .. 10.0]) "~=~" [5.3, 10.6 .. 53.0])
    ,(vecWithin (scale 2.0 [1.0 .. 100.0]) "~=~" [2.0, 4.0 .. 200.0])
    ,(vecWithin (scale 3.5 [4.0]) "~=~" [3.5*4.0])
    ]
add_tests :: [TestCase Vector]
add_tests = 
    [(vecWithin ([] `add` []) "~=~" [])
    ,(vecWithin ([0.0, 100.0, 200.0] `add` [1.0, 2.0, 4.0])
                    "~=~" [1.0, 102.0, 204.0])
    ,(vecWithin ([1.0 .. 10.0] `add` [100.0 .. 109.0]) 
                    "~=~" [101.0, 103.0 .. 119.0])
    ,(vecWithin ([1.0 .. 10.0] `add` [11.0 .. 20.0]) 
                    "~=~" ([12.0, 14.0 .. 30.0]))
    ,(vecWithin ([3.5] `add` [10.0]) "~=~" [13.5])
    ,(vecWithin ([3.5,6.2,8.2,5.99] `add` [7.2,9.6,13.1,15.5]) "~=~"
                    [10.7,15.8,21.299999999999997,21.490000000000002])
    ,(vecWithin ([-1.0] `add` [40.20]) "~=~" [39.20])
    ]
dot_tests :: [TestCase Double]
dot_tests = 
    [(withinTest ([] `dot` []) "~=~" 0.0)
    ,(withinTest ([0.0, 100.0, 200.0] `dot` [1.0, 2.0, 4.0])
                    "~=~" 1000.0)
    ,(withinTest ([1.0 .. 10.0] `dot` [100.0 .. 109.0]) 
                    "~=~" 5830.0)
    ,(withinTest ([1.0 .. 10.0] `dot` [11.0 .. 20.0]) 
                    "~=~" 935.0)
    ,(withinTest ([3.5] `dot` [4.7]) "~=~" (3.5*4.7))
    ,(withinTest ([3.5,1.0,10.1,599.25] `dot` [7.2,9.6,13.1,15.5]) "~=~" 9455.485)
    ,(withinTest ([-1.0] `dot` [40.20]) "~=~" (-40.2))
    ]

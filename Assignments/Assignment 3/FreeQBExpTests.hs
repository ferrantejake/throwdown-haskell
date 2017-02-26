-- $Id: FreeQBExpTests.hs,v 1.1 2015/02/12 04:23:12 leavens Exp leavens $
module FreeQBExpTests where
import QBExp
import FreeQBExp
import Testing
main = dotests "FreeQBExpTests $Revision: 1.1 $" tests
tests :: [TestCase [String]]
tests = [setEq (freeQBExp (Varref "x")) "==" ["x"]
        ,setEq (freeQBExp (Not (Varref "y"))) "==" ["y"]
        ,setEq (freeQBExp (Not (Not (Varref "y")))) "==" ["y"]
        ,setEq (freeQBExp ((Varref "x") `Or` (Not (Varref "y")))) "==" ["x","y"]
        ,setEq (freeQBExp ((Not (Varref "y")) `Or` (Varref "x"))) "==" ["y","x"]
        ,setEq (freeQBExp (((Varref "y") `Or` (Varref "x")) 
                            `Or` ((Varref "x") `Or` (Varref "y"))))
                    "==" ["y","x"]
        ,setEq (freeQBExp (Exists "y" (Not (Varref "y")))) "==" []
        ,setEq (freeQBExp (Exists "y" ((Not (Varref "y")) `Or` (Varref "z"))))
                    "==" ["z"]
        ,setEq (freeQBExp (Exists "z" (Exists "y" ((Not (Varref "y")) `Or` (Varref "z")))))
                    "==" []
        ,setEq (freeQBExp (Not 
                           ((Varref "z") 
                            `Or` (Exists "z" (Exists "y" ((Varref "y") `Or` (Varref "z")))))))
                    "==" ["z"]
        ,setEq (freeQBExp (((Varref "z") `Or` (Varref "q"))
                            `Or` (Not (Exists "z" (Exists "y" ((Varref "y") `Or` (Varref "z")))))))
                    "==" ["z","q"]  ]
    where setEq = gTest setEqual
          setEqual los1 los2 = (length los1) == (length los2)
                               && subseteq los1 los2
          subseteq los1 los2 = all (\e -> e `elem` los2) los1

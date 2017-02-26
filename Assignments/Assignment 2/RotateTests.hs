-- $Id: RotateTests.hs,v 1.2 2015/01/21 20:43:49 leavens Exp leavens $
module RotateTests where
import Testing
import Amount
import Rotate -- your code should go in this module
main = dotests "RotateTests $Revision: 1.2 $" tests
tests :: [TestCase Bool]
tests =
    [assertTrue ((rotate Zero (1,2,3,4)) == (1,2,3,4))
    ,assertTrue ((rotate One (1,2,3,4)) == (4,1,2,3))
    ,assertTrue ((rotate Two (1,2,3,4)) == (3,4,1,2))
    ,assertTrue ((rotate Three (1,2,3,4)) == (2,3,4,1))
    ,assertTrue ((rotate Two ("jan","feb","mar","apr")) == ("mar","apr","jan","feb"))
    ,assertTrue ((rotate Three ("jan","feb","mar","apr")) == ("feb","mar","apr","jan"))
    ,assertTrue ((rotate Zero (True,False,True,False)) == (True,False,True,False))
    ,assertTrue ((rotate One (True,False,True,False)) == (False,True,False,True)) ]

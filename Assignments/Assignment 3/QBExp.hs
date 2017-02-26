-- $Id: QBExp.hs,v 1.1 2015/02/12 04:23:12 leavens Exp leavens $
module QBExp where
data QBExp = Varref String | QBExp `Or` QBExp 
           | Not QBExp | Exists String QBExp
             deriving (Eq, Show)


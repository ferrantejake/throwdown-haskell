-- $Id: StatementsExpressions.hs,v 1.1 2015/02/12 04:23:12 leavens Exp leavens $
module StatementsExpressions where

data Statement = ExpStmt Expression 
               | AssignStmt String Expression
               | IfStmt Expression Statement
                 deriving (Eq, Show)

data Expression = VarExp String
    | NumExp Integer
    | EqualsExp Expression Expression
    | BeginExp [Statement] Expression
      deriving (Eq, Show)

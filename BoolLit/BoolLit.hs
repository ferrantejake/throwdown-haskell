data Exp = BoolLit Bool
    | IntLit Integer
    | Exp `Sub` Exp
    | Exp `Equal` Exp       -- <expression> 'equal' <expression
    | If Exp Exp Exp        -- 'if' <conditional> <then> <else>

-- Declare data types??
data Value = BV Bool | IV Integer | Wrong
        deriving (Eq)

data Type = OBool | OInteger | OWrong
        deriving (Eq, Show)

typeOf :: Exp -> Type
typeOf (BoolLit _) = OBool
typeOf (IntLit _) = OInteger
-- sub input and output type declaration
typeOf (e1 `Sub` e2) = case ((typeOf e1), (typeOf e2)) of
                        (OInteger, OInteger) -> OInteger        -- Input could be a OInteger and OInteger, which would return a OInteger
                        _ -> OWrong                              -- All other input types are wrong

-- Equal input and output type declaration
typeOf (e1 `Equal` e2) = case ((typeOf e1), (typeOf e2)) of
                        (OInteger, OInteger) -> OBool           -- Input could be OInteger, OInteger which returns a OBool
                        (OBool, OBool) -> OBool                 -- Input could be OBool and OBool, which would return OBool
                        _ -> OWrong                              -- Otherwise all other inputs types are not valid, this is 'wrong'

typeOf (If b e1 e2) = case (typeOf b) of
                        OBool -> let te1 = (typeOf e1)          -- Hold onto the e1 type
                            in if te1 == (typeOf e2)            -- If typeof e1 == typeof e2
                                then te1                        -- Then use the e1 expression 
                                else OWrong                     -- Else its wrong?
                        _ -> OWrong

eval :: Exp -> Value
eval (BoolLit x) = BV x
eval (IntLit x) = IV x
eval (e1 `Sub` e2) = case ((eval e1), (eval e2)) of
                        (IV a, IV b) -> (IV (a - b))            -- Pattern mmatch the first (right) case
                        _ -> Wrong                              -- Every other input pattern is wrong (;
eval (e1 `Equal` e2) = case ((eval e1), (eval e2)) of
                        (BV a, BV b) -> (BV (a == b))           -- If both are Boolean, then check if they are equal
                        (IV a, IV b) -> (BV (a == b))           -- If both are Integer, then check their values -- BV because the return type of a==b is a bool!
                        _ -> Wrong                              -- All other inputs are wrong!!!

eval (If b e1 e2) = case (eval b) of
                        (BV True) -> (eval e1)
                        (BV False) -> (eval e2)
                        _ -> Wrong

-- Overriding Show, here
instance Show Value where 
    show (BV b) = if b then "true" else "false"
    show (IV i) = "The integer is" ++ show i
    show wrong = "Wrong input types!"
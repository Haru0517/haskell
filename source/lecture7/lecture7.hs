
type AssocList a b = [(a, b)]


data DayOfWeek = Mon | Tue | Wed | Thu | Fri | Sat | Sun deriving (Eq, Show)

tomorrow :: DayOfWeek -> DayOfWeek
tomorrow Mon = Tue
tomorrow Tue = Wed
tomorrow Wed = Thu
tomorrow Thu = Fri
tomorrow Fri = Sat
tomorrow Sat = Sun
tomorrow Sun = Mon

theDayAfterTomorrow :: DayOfWeek -> DayOfWeek
theDayAfterTomorrow = tomorrow.tomorrow
-- theDayAfterTomorrow x = tomorrow (tomorrow x) -- これでもいける



-- Compound Data Type

data PointType = Point Int Int deriving Show

offset (Point x1 y1) (Point x2 y2) = Point (x1+x2) (y1+y2)


data Fraction = Fraction Int Int deriving (Eq, Ord, Show)


data Number = I Int | F Float deriving (Eq, Ord, Show)




-- Recursive Data Type

data Nat = Z | S Nat deriving (Eq, Ord, Show)

eqNat :: Nat -> Nat -> Bool
eqNat Z Z = True
eqNat (S m) (S n) = eqNat m n
eqNat _ _ = False

plusNat :: Nat -> Nat -> Nat
plusNat Z n = n
plusNat (S m) n = S (plusNat m n)

mulNat :: Nat -> Nat -> Nat
mulNat Z _ = Z
mulNat (S m) n = plusNat n (mulNat m n)


nat2Int :: Nat -> Int
nat2Int Z = 0
nat2Int (S x) = 1 + nat2Int x

int2Nat :: Int -> Nat
int2Nat 0 = Z
int2Nat x = S (int2Nat (x-1))


-- Handling tree

type Name = String
data IExpr = IConst Int
           | Var Name
           | Add IExpr IExpr
           | If BExpr IExpr IExpr
           | Let Name IExpr IExpr
           deriving Show

data BExpr = BConst Bool
           | And BExpr BExpr
           | Not BExpr
           | Eq IExpr IExpr
           deriving Show


type Env = [(Name, Int)]

evalI :: Env -> IExpr -> Int
evalI _ (IConst n) = n
evalI env (Var x) = 
    case lookup x env of
        Nothing -> error $"unknown variable: " ++ x
        Just v -> v
evalI env (Add e1 e2) = evalI env e1 + evalI env e2
evalI env (If b e1 e2) | evalB env b = evalI env e1
                       | otherwise = evalI env e2
evalI env (Let x e1 e2) = evalI env' e2
    where
        env' = (x, evalI env e1): env

evalB :: Env -> BExpr -> Bool
evalB _ (BConst b) = b
evalB env (And b1 b2) = evalB env b1 && evalB env b2
evalB env (Not b) = not  $ evalB env b
evalB env (Eq e1 e2) = evalI env e1 == evalI env e2



-- Lazy Evaluation

myAnd :: Bool -> Bool -> Bool
myAnd False _ = False
myAnd _ e = e


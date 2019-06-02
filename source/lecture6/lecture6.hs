length1 :: [a]->Int
length1 [ ] = 0
length1 (_:xs) = 1 + length1 xs


factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n-1)

addVectors :: (Int, Int) -> (Int, Int) -> (Int, Int)
addVectors (x1, y1) (x2, y2) = (x1+x2, y1+y2)


sinCos :: Bool -> Float -> Float
sinCos b x = if b then sin x else cos x

sinCos2 :: Bool -> Float -> Float
sinCos2 b x = (if b then sin else cos) x


double x = x+x
twice f x = f (f x)


curry :: ((a,b) -> c) -> a -> b -> c
curry f = \x -> \y -> f (x, y)

uncurry :: (a -> b -> c) -> (a, b) -> c
uncurry f = \(x, y) -> f x y
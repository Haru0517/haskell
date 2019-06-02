fact :: Int -> Int
fact 0 = 1
fact n = n * fact (n-1)

fibo :: Int -> Int
fibo 0 = 1
fibo 1 = 1
fibo n = fibo (n-1)+fibo (n-2)

power1 :: Int -> Int -> Int
power1 _ 0 = 1
power1 a n | even n = a'*a'
          | otherwise = a*a'*a'
    where
        a' = power1 a (n `div` 2)


euclid :: Int -> Int -> Int
euclid 0 n = n
euclid m n | m < n = euclid n m
           | otherwise = euclid (m-n) n


fibo2 :: Int -> Int
fibo2 k = aux 0 1 k

aux :: Int -> Int -> Int -> Int
aux m _ 0 = m
aux _ n 1 = n
aux m n k = aux n (m+n) (k-1)


first :: a -> b -> a
first x _ = x

second :: a -> b -> b
second _ x = x


ifFun :: Bool -> a -> a -> a
ifFun True e _ = e
ifFun False _ e = e


plusP :: (Int, Int) -> Int
plusP (x, y) = x + y


mid3 :: (a, b, c) -> b
mid3 (_, y, _) = y


mkFrac :: Int -> Int -> (Int, Int)
mkFrac m n | n /= 0 = (m, n)

addFrac :: (Int, Int)->(Int, Int)->(Int, Int)
addFrac (a, b) (c, d) = simpleFrac (a*d+b*c, b*d)

mulFrac :: (Int, Int)->(Int, Int)->(Int, Int)
mulFrac (a, b) (c, d) = simpleFrac (a*c, b*d)

simpleFrac :: (Int, Int)->(Int, Int)
simpleFrac (a, b) = (a `div` d, b `div` d)
        where d = gcd a b
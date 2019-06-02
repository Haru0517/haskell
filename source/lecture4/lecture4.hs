square_sum :: Int -> Int -> Int -> Int
square_sum x y z = x*x + y*y + z*z


zero :: Int
zero = 0


result :: Float
result=let a = pi/6 in tan a


result2 :: Float
result2 = let { x = cos a; y = sin a; a = pi/6 }
            in y/x


result3 :: Float
result3 = let x=cos a
              y=sin a
              a=pi/6
          in
            y/x


successor :: Int -> Int
successor n = 1 + n

recip1 :: Float -> Float
recip1 n = 1/n

even1 :: Int -> Bool
even1 n = if n `mod` 2 == 0 then True else False

even2 :: Int -> Bool
even2 n = n `mod` 2 == 0


stirling :: Int -> Float
stirling n = sqrt (2*pi*n')*((n'/exp 1)**n')
    where
        n' :: Float
        n' = fromIntegral n


absolute :: Int -> Int
absolute n = if n>=0 then n else -n

absolute1 :: Int -> Int
absolute1 n | n>=0 = n
            | n<0 = negate n


-- エラー出て実行できん
-- safeRecip :: Fractional a => a->a
-- safeRecip 0 = 0
-- safeRecip n = 1/n

add2 :: Int -> Int -> Int
add2 x y = x+y

times3 :: Int -> Int -> Int -> Int
times3 x y z = x*y*z
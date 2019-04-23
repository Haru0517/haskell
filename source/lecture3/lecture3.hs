{- 階乗を計算する関数

実行例：
fact1 3 -> 6
fact2 4 -> 24
-}

fact1 :: Int -> Int
fact1 n = if n==0 then 1
          else n*fact1 (n-1)


fact2 :: Int -> Int
fact2 n
    | n == 0    = 1
    | otherwise = n*fact2 (n-1)


fact3 :: Int -> Int
fact3 0 = 1
fact3 n = n*fact3 (n-1)


fact6 :: Int -> Int
fact6 n = product [1..n]



{- クイックソート

実行例：
qsort [1,5,7,4,23,6] -> [1,4,5,6,7,23]
qsort "Hello World" -> " HWdellloor"
-}
qsort :: (Ord a) => [a] -> [a]
qsort [] = []
qsort (x:xs) = qsort l1 ++ [x] ++ qsort l2
    where
        l1 = filter (<= x) xs
        l2 = filter (> x) xs

{- filter関数はこんな感じ
filter :: (a -> Bool) -> [a] -> [a]
filter _ [] = []
filter p (x : xs) | p x = x : filter p xs
                  | otherwise = filter p xs
-}


-- main文で実行
main :: IO ()
main = do s<- getContents
          putStrLn $ qsort s

{- 
実行例：
ghc lecture3.hs
./lecture3
入力> Doshisha University
Ctl+D> DUaehhiiinorssstvy
-}

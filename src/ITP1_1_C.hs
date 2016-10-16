-- http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ITP1_1_C
-- Rectangle

-- input:  3 5
-- output: 15 16

import Control.Applicative

main = do
    [a, b] <- map read . words <$> getLine
    let x = area a b
        y = circumference a b
    putStrLn $ show x ++ " " ++ show y

area :: Int -> Int -> Int
area a b = a * b

circumference :: Int -> Int -> Int
circumference a b = (a + b) * 2

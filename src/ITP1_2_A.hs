-- http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ITP1_2_A
-- Small, Large, or Equal

-- input:  1 2
-- output: a < b

-- input:  4 3
-- output: a > b

-- input:  5 5
-- output: a == b

import Control.Applicative

main = do
    [a, b] <- map read . words <$> getLine
    putStrLn $ a `compare'` b

compare' :: Int -> Int -> String
compare' a b
    | ordering == LT = "a < b"
    | ordering == EQ = "a == b"
    | ordering == GT = "a > b"
    where ordering = a `compare` b

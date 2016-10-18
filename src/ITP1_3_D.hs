-- http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ITP1_3_D
-- How Many Divisors?

-- input: 5 14 80
-- output: 3

import Control.Applicative

main = do
    [a,b,c] <- map (read :: String -> Int) . words <$> getLine
    print $ length $ findDivisors a b c

findDivisors :: Int -> Int -> Int -> [Int]
findDivisors a b c = [n | n <- [a..b], c `mod` n == 0]

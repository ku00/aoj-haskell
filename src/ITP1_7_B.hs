-- http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ITP1_7_B
-- How many ways?

-- input:
-- 5 9
-- 0 0

-- output:
-- 2

import Control.Applicative ((<$>))
import qualified Control.Monad as Monad (when)

main = do
    nx <- getLine' $ map read . words
    Monad.when (any (/= 0) nx) $ do
        print $ length $ combination nx
        main

getLine' :: (String -> a) -> IO a
getLine' f = f <$> getLine

combination :: [Int] -> [[Int]]
combination [n,x] = [[a,b,c] | a <- [1..n], b <- [a..n], c <- [b..n],
                                a + b + c == x, a /= b, a/= c, b /= c]

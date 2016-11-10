-- http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ITP1_9_B
-- Shuffle

-- input:
-- aabc
-- 3
-- 1
-- 2
-- 1
-- vwxyz
-- 2
-- 3
-- 4
-- -

-- output:
-- aabc
-- xyzvw

import Control.Applicative ((<$>))
import qualified Control.Monad as Monad (when, replicateM)

main = do
    s <- getLine
    Monad.when (s /= "-") $ do
        m <- read <$> getLine
        hs <- map read <$> Monad.replicateM m getLine
        putStrLn $ repeatShuffle hs s
        main

repeatShuffle :: [Int] -> String -> String
repeatShuffle [] s     = s
repeatShuffle (x:xs) s = repeatShuffle xs $ shuffle x s

shuffle :: Int -> String -> String
shuffle h s = s2 ++ s1
    where (s1,s2) = splitAt h s

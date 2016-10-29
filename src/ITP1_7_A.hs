-- http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ITP1_7_A
-- Grading

-- input:
-- 40 42 -1
-- 20 30 -1
-- 0 2 -1
-- -1 -1 -1

-- output:
-- A
-- C
-- F

import Control.Applicative ((<$>))
import qualified Control.Monad as Monad (when)

main = loopGrading

loopGrading :: IO ()
loopGrading = do
    result <- map (read :: String -> Int) . words <$> getLine
    Monad.when (any (/= (-1)) result) $ do
        putStrLn $ grading result
        loopGrading

grading :: [Int] -> String
grading [m,f,r]
    | m == (-1) || f == (-1) = "F"
    | total >= 80            = "A"
    | total >= 65            = "B"
    | total >= 50 || r >= 50 = "C"
    | total >= 30            = "D"
    | otherwise              = "F"
    where total = m + f

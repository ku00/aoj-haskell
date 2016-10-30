-- http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ITP1_6_D
-- Matrix Vector Multiplication

-- input:
-- 3 4
-- 1 2 0 1
-- 0 3 0 1
-- 4 1 1 0
-- 1
-- 2
-- 3
-- 0

-- output:
-- 5
-- 6
-- 9

import Control.Applicative ((<$>))
import qualified Control.Monad as Monad (forM, replicateM)

type Vector = [Int]
type Row = [Int]
type Matrix = [Row]

main = do
    [n,m] <- getLine'
    a <- Monad.replicateM n getLine'
    b <- toVector <$> Monad.replicateM m getLine'
    mapM_ print $ vectorAndMatrixProduct a b

getLine' :: IO [Int]
getLine' = map (read :: String -> Int) . words <$> getLine

toVector :: [[Int]] -> Vector
toVector = concat

vectorAndMatrixProduct :: Matrix -> Vector -> Vector
vectorAndMatrixProduct xs ys = toVector $ do
    Monad.forM [0..(length xs - 1)] $ \i -> dotProduct (xs !! i) ys

dotProduct :: Row -> Vector -> Row
dotProduct xs ys = return $ sum $ zipWith (*) xs ys

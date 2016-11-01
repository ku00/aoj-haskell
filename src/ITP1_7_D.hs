-- http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ITP1_7_D
-- Matrix Multiplication

-- input:
-- 3 2 3
-- 1 2
-- 0 3
-- 4 5
-- 1 2 1
-- 0 3 2

-- output:
-- 1 8 5
-- 0 9 6
-- 4 23 14

import Control.Applicative ((<$>), (<*>))
import qualified Control.Monad as Monad (replicateM)
import qualified Data.List as List (transpose)
import qualified Data.List.Split as Split (chunksOf)

type Row = [Int]
type Matrix = [Row]

main = do
    [n,m,l] <- getLine'
    a <- Monad.replicateM n getLine'
    b <- Monad.replicateM m getLine'
    let result = toMatrix l $ dotProduct <$> a <*> List.transpose b
    mapM_ (putStrLn . printFormat) result

getLine' :: IO [Int]
getLine' = map (read :: String -> Int) . words <$> getLine

printFormat :: Row -> String
printFormat xs = unwords $ show <$> xs

toMatrix :: Int -> [Int] -> Matrix
toMatrix n xs = Split.chunksOf n xs

dotProduct :: Row -> Row -> Int
dotProduct xs ys = sum $ zipWith (*) xs ys

-- http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ITP1_7_C
-- Spreadsheet

-- input:
-- 4 5
-- 1 1 3 4 5
-- 2 2 2 4 5
-- 3 3 0 1 1
-- 2 3 4 4 6

-- output:
-- 1 1 3 4 5 14
-- 2 2 2 4 5 15
-- 3 3 0 1 1 8
-- 2 3 4 4 6 19
-- 8 9 9 13 17 56

import Control.Applicative ((<$>))
import qualified Control.Monad as Monad (forM, replicateM)

type Row = [Int]
type Spreadsheet = [Row]

main = do
    [r,c] <- getLine'
    xs <- Monad.replicateM r $ getLine'
    mapM_ (putStrLn . printFormat) =<< newSpreadsheet (c+1) xs

getLine' :: IO [Int]
getLine' = map read . words <$> getLine

printFormat :: Row -> String
printFormat xs = unwords $ show <$> xs

newSpreadsheet :: Int -> Spreadsheet -> IO Spreadsheet
newSpreadsheet n xs = do
    let xs' = zipWith (++) xs $ rowSums xs
    return $ xs' ++ columnSums n xs'

rowSums :: Spreadsheet -> Spreadsheet
rowSums = map $ (:[]) . sum

columnSums :: (Monad m) =>Int -> Spreadsheet -> m Row
columnSums n xs = Monad.forM [0..(n-1)] $ \i -> return $ sum $ map (!! i) xs

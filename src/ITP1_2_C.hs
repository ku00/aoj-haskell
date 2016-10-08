-- http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ITP1_2_C
-- Sorting Three Numbers

-- "3 8 1"
-- "1 3 8"

import qualified Data.List as List

main = do
    l <- getLine
    let xs = map read $ words l :: [Int]
        sxs = map show $ List.sort xs
    putStrLn $ unwords sxs

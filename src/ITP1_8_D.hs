-- http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ITP1_8_D
-- Ring

-- input:
-- vanceknowledgetoad
-- advance

-- output:
-- Yes

-- input2:
-- vanceknowledgetoad
-- advanced

-- output2:
-- No

import qualified Data.List as List

main = do
    s <- getLine
    p <- getLine
    putStrLn $ if elemFromRing (List.elemIndices (head p) s) s p then "Yes" else "No"

elemFromRing :: [Int] -> String -> String -> Bool
elemFromRing [] _  _ = False
elemFromRing (x:xs) s p
    | pickFromRing [x..(x + length p - 1)] s == p = True
    | otherwise                                   = elemFromRing xs s p

pickFromRing :: [Int] -> String -> String
pickFromRing [] _ = []
pickFromRing (n:ns) xs = xs !! (n `mod` length xs) : pickFromRing ns xs

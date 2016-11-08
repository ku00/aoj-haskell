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

import Data.List

pick' :: [Int] -> String -> String
pick' [] _ = []
pick' (n:ns) xs = xs !! (n `mod` length xs) : pick' ns xs

-- let s = "vanceknowledgetoad"

-- elemIndices 'a' s
-- [1,16]

-- pick' [1..19] s
-- "anceknowledgetoadva"
-- pick' [1..7] s
-- "ancekno"
-- pick' [16..22] s
-- "advance"

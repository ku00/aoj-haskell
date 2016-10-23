-- http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ITP1_6_A
-- Reversing Numbers

-- input1:
-- 5
-- 1 2 3 4 5
--
-- output2:
-- 5 4 3 2 1
--
-- input2:
-- 8
-- 3 3 4 4 5 8 7 9
--
-- output2:
-- 9 7 8 5 4 4 3 3

import Control.Applicative

main = do
    getLine
    xs <- map (read :: String -> Int) . words <$> getLine
    putStrLn $ unwords $ show <$> reverse xs

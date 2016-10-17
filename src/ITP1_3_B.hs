-- http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ITP1_3_B
-- Print Test Cases

-- input:
-- 3
-- 5
-- 11
-- 7
-- 8
-- 19
-- 0

-- output:
-- Case 1: 3
-- Case 2: 5
-- Case 3: 11
-- Case 4: 7
-- Case 5: 8
-- Case 6: 19

import qualified Control.Monad as Monad

main = loopPutCase 1

loopPutCase :: Int -> IO ()
loopPutCase i = do
    x <- getLine
    Monad.when (read x /= 0) $ do
        putStrLn $ "Case " ++ show i ++ ": " ++ x
        loopPutCase $ i + 1

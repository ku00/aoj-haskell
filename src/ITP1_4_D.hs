-- http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ITP1_4_D
-- Min, Max and Sum

-- input:
-- 5
-- 10 1 5 4 17

-- output:
-- 1 17 37

import Control.Applicative
import qualified Control.Monad as Monad

main = do
    getLine
    xs <- map (read :: String -> Int) . words <$> getLine
    putStrLn $ unwords $ show <$> Monad.sequence [minimum, maximum, sum] xs

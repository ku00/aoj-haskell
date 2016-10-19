-- http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ITP1_4_D
-- Min, Max and Sum

-- input:
-- 5
-- 10 1 5 4 17

-- output:
-- 1 17 37

import Control.Applicative
import qualified Data.Traversable as Traversable

main = do
    getLine  -- discard
    xs <- map (read :: String -> Int) . words <$> getLine
    putStrLn $ unwords $ show <$> Traversable.sequenceA [minimum, maximum, sum] xs

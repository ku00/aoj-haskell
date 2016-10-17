-- http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ITP1_3_C
-- Swapping Two Numbers

-- input:
-- 3 2
-- 2 2
-- 5 3
-- 0 0

-- output:
-- 2 3
-- 2 2
-- 3 5

import Control.Applicative
import qualified Control.Monad as Monad

main = loopPutNumbers

loopPutNumbers :: IO ()
loopPutNumbers = do
    [x,y] <- map (read :: String -> Int) . words <$> getLine
    Monad.when (x /= 0 || y /= 0) $ do
        putStrLn $ if (x < y)
                    then unwords $ show <$> [x,y]
                    else unwords $ show <$> [y,x]
        loopPutNumbers

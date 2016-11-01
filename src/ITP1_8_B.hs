-- http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ITP1_8_B
-- Sum of Numbers

-- input:
-- 123
-- 55
-- 1000
-- 0

-- output:
-- 6
-- 10
-- 1

import Control.Applicative ((<$>))
import qualified Control.Monad as Monad (when)
import qualified Data.Char as Char (digitToInt)

main = do
    s <- getLine
    Monad.when (read s /= 0) $ do
        print $ sum $ Char.digitToInt <$> s
        main

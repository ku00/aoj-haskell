-- http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ITP1_4_C
-- Simple Calculator

-- input:
-- 1 + 2
-- 56 - 18
-- 13 * 2
-- 100 / 10
-- 27 + 81
-- 0 ? 0

-- output:
-- 3
-- 38
-- 26
-- 10
-- 108

import Control.Applicative
import qualified Control.Monad as Monad

main = calculator

calculator :: IO ()
calculator = do
    [a, op, b] <- words <$> getLine
    Monad.when (op /= "?") $ do
        print $ calculate (read a) op (read b)
        calculator

calculate :: Int -> String -> Int -> Int
calculate a op b = interpret op
    where interpret "+" = a + b
          interpret "-" = a - b
          interpret "*" = a * b
          interpret "/" = a `div` b

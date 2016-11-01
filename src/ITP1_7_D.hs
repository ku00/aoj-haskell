-- http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ITP1_7_D
-- Matrix Multiplication

-- input:
-- 3 2 3
-- 1 2
-- 0 3
-- 4 5
-- 1 2 1
-- 0 3 2

-- output:
-- 1 8 5
-- 0 9 6
-- 4 23 14

import Control.Applicative
import Control.Monad

type Row = [Int]
type Matrix = [Row]

dotProduct :: Row -> Row -> Int
dotProduct xs ys = sum $ zipWith (*) xs ys

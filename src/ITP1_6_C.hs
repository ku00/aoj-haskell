-- http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ITP1_6_C
-- Official House

-- input:
-- 3
-- 1 1 3 8
-- 3 2 2 7
-- 4 3 8 1

-- output:
--  0 0 8 0 0 0 0 0 0 0
--  0 0 0 0 0 0 0 0 0 0
--  0 0 0 0 0 0 0 0 0 0
-- ####################
--  0 0 0 0 0 0 0 0 0 0
--  0 0 0 0 0 0 0 0 0 0
--  0 0 0 0 0 0 0 0 0 0
-- ####################
--  0 0 0 0 0 0 0 0 0 0
--  0 7 0 0 0 0 0 0 0 0
--  0 0 0 0 0 0 0 0 0 0
-- ####################
--  0 0 0 0 0 0 0 0 0 0
--  0 0 0 0 0 0 0 0 0 0
--  0 0 0 0 0 0 0 1 0 0

import Control.Applicative

type Room = (Int, Int, Int, Int)

toRoom :: [String] -> Room
toRoom [b,f,r,v] = read <$> (b,f,r,v)

officialHouse :: [Room]
officialHouse = [ (b,f,r,0) | b <- [1..4], f <- [1..3], r <- [1..10] ]

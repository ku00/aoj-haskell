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
import qualified Control.Monad as Monad

type Room = (Int, Int, Int, Int)

-- main = do
--     n <- read <$> getLine
--     es <- toRoom . map (read :: String -> Int) . words <$> Monad.replicateM n getLine
--     mapM_ putStrLn $ es `entryStudent` officialHouse

toRoom :: [Int] -> Room
toRoom [b,f,r,v] = (b,f,r,v)

officialHouse :: [Room]
officialHouse = [ (b,f,r,0) | b <- [1..4], f <- [1..3], r <- [1..10] ]

entryStudent :: Room -> [Room] -> [Room]
entryStudent _ [] = []
entryStudent room1@(a1,b1,c1,d1) (room2@(a2,b2,c2,d2):rs)
    | (a1,b1,c1) == (a2,b2,c2) = (a1,b1,c1,(d1 + d2)) : rs
    | otherwise                = room2 : room1 `entryStudent` rs

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
import Control.Monad.State

type Room = (Int, Int, Int, Int)

-- main = do
--     n <- read <$> getLine
--     let oh = officialHouse :: State () [Room]
--     print $ execState $ getRoomInfo n oh

-- getRoomInfo :: Int -> State [Room] ()
-- getRoomInfo n = do
--     Monad.forM_ [1..n] $ \_ -> do
--         r <- toRoom . map (read :: String -> Int) . words <$> getLine
--         putRooms r

toRoom :: [Int] -> Room
toRoom [b,f,r,v] = (b,f,r,v)

officialHouse :: [Room]
officialHouse = [ (b,f,r,0) | b <- [1..4], f <- [1..3], r <- [1..10] ]

putRooms :: Room -> State [Room] ()
putRooms r = do
    rs <- get
    put $ updateRooms rs r

updateRooms :: [Room] -> Room -> [Room]
updateRooms [] _ = []
updateRooms (room1@(a1,b1,c1,d1):rs) room2@(a2,b2,c2,d2)
    | (a1,b1,c1) == (a2,b2,c2) = (a1,b1,c1,(d1 + d2)) : rs
    | otherwise                = room1 : updateRooms rs room2

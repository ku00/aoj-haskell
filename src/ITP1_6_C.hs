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
import qualified Control.Monad as Monad (forM_)
import qualified Control.Monad.Trans as Trans (lift)
import qualified Control.Monad.State as State (execStateT, modify)
import qualified Data.List.Split as Split (chunksOf)

type Room = (Int, Int, Int, Int)

main = do
    n <- getLine
    rs <- putRooms (read n)
    let rs' = Split.chunksOf limitRoom $ zipWith (++) (repeat " ") (show . getValue <$> rs)
    Monad.forM_ [1..(limitBuilding*limitFloor)] $ \bf -> do
        putStrLn $ concat $ rs' !! (bf-1)
        if ((bf `mod` limitFloor == 0) && bf /= (limitBuilding*limitFloor))
            then putStrLn "####################"
            else return ()

putRooms :: Int -> IO [Room]
putRooms n = (`State.execStateT` officialHouse) $ do
    Monad.forM_ [1..n] $ \_ -> do
        room <- Trans.lift $ toRoom . map (read :: String -> Int) . words <$> getLine
        State.modify (`updateRoom` room)

limitBuilding = 4
limitFloor    = 3
limitRoom     = 10

officialHouse :: [Room]
officialHouse = [ (b,f,r,0) | b <- [1..limitBuilding],
                              f <- [1..limitFloor],
                              r <- [1..limitRoom] ]

toRoom :: [Int] -> Room
toRoom [b,f,r,v] = (b,f,r,v)

getValue :: Room -> Int
getValue (_, _, _, v) = v

updateRoom :: [Room] -> Room -> [Room]
updateRoom [] _ = []
updateRoom (room1@(b1,f1,r1,v1):rs) room2@(b2,f2,r2,v2)
    | (b1,f1,r1) == (b2,f2,r2) = (b1,f1,r1,(v1 + v2)) : rs
    | otherwise                = room1 : updateRoom rs room2

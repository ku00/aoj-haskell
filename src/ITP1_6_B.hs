-- http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ITP1_6_B
-- Finding Missing Cards

-- input:
-- 47
-- S 10
-- S 11
-- S 12
-- S 13
-- H 1
-- H 2
-- S 6
-- S 7
-- S 8
-- S 9
-- H 6
-- H 8
-- H 9
-- H 10
-- H 11
-- H 4
-- H 5
-- S 2
-- S 3
-- S 4
-- S 5
-- H 12
-- H 13
-- C 1
-- C 2
-- D 1
-- D 2
-- D 3
-- D 4
-- D 5
-- D 6
-- D 7
-- C 3
-- C 4
-- C 5
-- C 6
-- C 7
-- C 8
-- C 9
-- C 10
-- C 11
-- C 13
-- D 9
-- D 10
-- D 11
-- D 12
-- D 13

-- output:
-- S 1
-- H 3
-- H 7
-- C 12
-- D 8

import Control.Applicative
import qualified Control.Monad as Monad

type Card = (String, Int)

main = do
    n <- read <$> getLine
    hc <- map (toCard . words) <$> Monad.replicateM n getLine
    mapM_ (putStrLn . fromCard) $ missingCards hc

toCard :: [String] -> Card
toCard [p,r] = (p, read r)

fromCard :: Card -> String
fromCard (p,r) = p ++ " " ++ (show r)

missingCards :: [Card] -> [Card]
missingCards hc = [ (p,r) | p <- ["S","H","C","D"], r <- [1..13], not $ (p,r) `elem` hc ]

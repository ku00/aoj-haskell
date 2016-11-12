-- http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ITP1_9_C
-- Card Game

-- input:
-- 3
-- cat dog
-- fish fish
-- lion tiger

-- output:
-- 1 7

import Control.Applicative ((<$>))
import qualified Control.Monad as Monad (replicateM)

type Hands = [String]
type Points = [Int]

main = do
    n <- read <$> getLine
    hs <- map words <$> Monad.replicateM n getLine
    putStrLn . unwords $ show <$> cardGame hs

cardGame :: [Hands] -> Points
cardGame hs = foldr1 (\x acc -> zipWith (+) x acc) $ map oneGame hs

oneGame :: Hands -> Points
oneGame [a,b]
    | result == LT = [0,3]
    | result == EQ = [1,1]
    | result == GT = [3,0]
    where result = a `compare` b

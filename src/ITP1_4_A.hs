-- http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ITP1_4_A
-- A / B Problem

import Control.Applicative
import Data.Fixed

main = do
    [a,b] <- map (read :: String -> Int) . words <$> getLine
    putStrLn $
        show (a `div` b) ++ " " ++
        show (a `mod` b) ++ " " ++
        show ((realToFrac a) / (realToFrac b) :: Fixed E9)

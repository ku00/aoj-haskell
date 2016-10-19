-- http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ITP1_4_B
-- Circle

-- input:  2
-- output: 12.566371 12.566371

import Control.Applicative
import Data.Fixed

main = do
    r <- (read :: String -> Double) <$> getLine
    putStrLn $ unwords $ show . toFixedE9 <$> [(pi*r^2), (2*pi*r)]

toFixedE9 :: Double -> Fixed E9
toFixedE9 r = realToFrac r :: Fixed E9

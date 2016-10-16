-- http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ITP1_2_C
-- Sorting Three Numbers

-- "3 8 1"
-- "1 3 8"

import qualified Data.List as List
import Control.Applicative

main = do
    xs <- map (read :: String -> Int) . words <$> getLine
    putStrLn $ unwords . map show $ List.sort xs

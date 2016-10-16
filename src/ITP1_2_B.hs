-- http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ITP1_2_B
-- Range

-- "1 3 8"
-- "Yes"

-- "3 8 1"
-- "No"

import Control.Applicative

main = do
    [a, b, c] <- map (read :: String -> Int) . words <$> getLine
    putStrLn $ if a < b && b < c
                 then "Yes"
                 else "No"

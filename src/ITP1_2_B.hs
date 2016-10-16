-- http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ITP1_2_B
-- Range

-- input:  1 3 8
-- output: Yes

-- input:  3 8 1
-- output: No

import Control.Applicative

main = do
    [a, b, c] <- map (read :: String -> Int) . words <$> getLine
    putStrLn $ if a < b && b < c
                 then "Yes"
                 else "No"

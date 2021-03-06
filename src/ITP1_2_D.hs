-- http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ITP1_2_D
-- Circle in a Rectangle

-- input:  5 4 2 2 1
-- output: Yes

-- input:  5 4 2 4 1
-- output: No

import Control.Applicative

main = do
    [w, h, x, y, r] <- map (read :: String -> Int) . words <$> getLine
    putStrLn $ if overWidth w x r || overHeight h y r
                 then "No"
                 else "Yes"

overWidth :: Int -> Int -> Int -> Bool
overWidth w x r = (x - r < 0) || (w < x + r)

overHeight :: Int -> Int -> Int -> Bool
overHeight h y r = (y - r < 0) || (h < y + r)

-- http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ITP1_2_D
-- Circle in a Rectangle

-- "5 4 2 2 1"
-- "Yes"

-- "5 4 2 4 1"
-- "No"

main = do
    l <- getLine
    let (w:h:x:y:r:[]) = map read $ words l :: [Int]
    putStrLn $ if overWidth w x r || overHeight h y r
                 then "No"
                 else "Yes"

overWidth :: Int -> Int -> Int -> Bool
overWidth w x r = (x - r < 0) || (w < x + r)

overHeight :: Int -> Int -> Int -> Bool
overHeight h y r = (y - r < 0) || (h < y + r)

-- http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ITP1_1_D
-- Watch

-- input:  46979
-- output: 13:2:59

main = do
    s <- getLine
    putStrLn $ toTime (read s :: Int) 2

toTime :: Int -> Int -> String
toTime s 0 = show s
toTime s n = show divSecond ++ ":" ++ toTime modSecond (n-1)
    where divSecond  = s `div` (60 ^ n)
          modSecond  = s `mod` (60 ^ n)

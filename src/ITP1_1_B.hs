-- http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ITP1_1_B
-- X Cubic

main = do
    x <- getLine
    putStrLn $ powerThree $ read x :: Int

powerThree:: Int -> Int
powerThree = (^3)

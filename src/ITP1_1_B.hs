-- http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ITP1_1_B
-- X Cubic

-- "3"
-- "27"

main = do
    x <- getLine
    print $ powerThree $ read x

powerThree :: Int -> Int
powerThree = (^3)

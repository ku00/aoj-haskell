-- http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ITP1_2_A
-- Small, Large, or Equal

-- "1 2"
-- "a < b"

-- "4 3"
-- "a > b"

-- "5 5"
-- "a == b"

main = do
    l <- getLine
    let (a:b:[]) = map read $ words l :: [Int]
    putStrLn $ a `compare'` b

compare' :: Int -> Int -> String
compare' a b
    | ordering == LT = "a < b"
    | ordering == EQ = "a == b"
    | ordering == GT = "a > b"
    where ordering = a `compare` b

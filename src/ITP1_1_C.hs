-- http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ITP1_1_C
-- Rectangle

-- "3 5"
-- "15 16"

main = do
    l <- getLine
    let (a:b:[]) = map read $ words l :: [Int]
        x = area a b
        y = circumference a b
    putStrLn $ show x ++ " " ++ show y

area :: Int -> Int -> Int
area a b = a * b

circumference :: Int -> Int -> Int
circumference a b = (a + b) * 2

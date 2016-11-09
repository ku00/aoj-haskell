-- http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ITP1_9_B
-- Shuffle

-- input:
-- aabc
-- 3
-- 1
-- 2
-- 1
-- vwxyz
-- 2
-- 3
-- 4
-- -

-- output:
-- aabc
-- xyzvw

shuffle :: Int -> String -> String
shuffle h s = s2 ++ s1
    where (s1,s2) = splitAt h s

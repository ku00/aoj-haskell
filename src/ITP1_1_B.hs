-- http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ITP1_1_B
-- X Cubic

-- input:  3
-- output: 27

main = getLine >>= print . (^3) . read

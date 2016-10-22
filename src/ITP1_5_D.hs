-- http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ITP1_5_D
-- Structured Programming

-- sample program:
--
-- void call(int n){
--   int i = 1;
--  CHECK_NUM:
--   int x = i;
--   if ( x % 3 == 0 ){
--     cout << " " << i;
--     goto END_CHECK_NUM;
--   }
--  INCLUDE3:
--   if ( x % 10 == 3 ){
--     cout << " " << i;
--     goto END_CHECK_NUM;
--   }
--   x /= 10;
--   if ( x ) goto INCLUDE3;
--  END_CHECK_NUM:
--   if ( ++i <= n ) goto CHECK_NUM;
--
--   cout << endl;
-- }

-- input:  30
-- output:  3 6 9 12 13 15 18 21 23 24 27 30

import Control.Applicative

main = do
    n <- read <$> getLine
    putStrLn $
        concat $ zipWith (++) (repeat " ") (show <$> filterCheckNumber n)

filterCheckNumber :: Int -> [Int]
filterCheckNumber n = [ x | x <- [1..n], (x `mod` 3 == 0) || includeThree x ]

includeThree :: Int -> Bool
includeThree x
    | x == 0          = False
    | x `mod` 10 == 3 = True
    | otherwise       = includeThree $ x `div` 10

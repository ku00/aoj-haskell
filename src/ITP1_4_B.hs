-- http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ITP1_4_B
-- Circle

-- input:  2
-- output: 12.566371 12.566371

import Control.Applicative

main = do
    r <- (read :: String -> Float) <$> getLine
    putStrLn $ unwords $ show <$> [(pi*r^2), (2*pi*r)]

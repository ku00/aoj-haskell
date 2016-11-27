-- http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ITP1_8_A
-- Toggling Cases

-- input:
-- fAIR, LATER, OCCASIONALLY CLOUDY.

-- output:
-- Fair, later, occasionally cloudy.

import qualified Data.Char as Char (isUpper, isLower, toUpper, toLower)

main = putStrLn . toggleCases =<< getLine

toggleCases :: String -> String
toggleCases [] = []
toggleCases (x:xs)
    | Char.isLower x = Char.toUpper x : toggleCases xs
    | Char.isUpper x = Char.toLower x : toggleCases xs
    | otherwise      = x : toggleCases xs

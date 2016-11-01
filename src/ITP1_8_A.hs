-- http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ITP1_8_A
-- Toggling Cases

-- input:
-- fAIR, LATER, OCCASIONALLY CLOUDY.

-- output:
-- Fair, later, occasionally cloudy.

import qualified Data.Char as Char

main = putStrLn . toggleCases =<< getLine

toggleCases :: String -> String
toggleCases [] = []
toggleCases (x:xs)
    | x `elem` ['a'..'z'] = Char.toUpper x : toggleCases xs
    | x `elem` ['A'..'Z'] = Char.toLower x : toggleCases xs
    | otherwise           = x : toggleCases xs

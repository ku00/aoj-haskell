-- http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ITP1_9_A
-- Finding a Word

-- input:
-- computer
-- Nurtures computer scientists and highly-skilled computer engineers
-- who will create and exploit "knowledge" for the new era.
-- Provides an outstanding computer environment.
-- END_OF_TEXT

-- output:
-- 3

import Control.Applicative ((<$>))
import qualified Data.Char as Char (toLower)

main = do
    w <- getLine
    t <- getContents
    print $ length $ findWord w t

findWord :: String -> String -> [String]
findWord w t = filter (\x -> w == (Char.toLower <$> x)) $ concat $ words <$> lines t

-- http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ITP1_8_C
-- Counting Characters

-- input:
-- This is a pen.

-- output:
-- a : 1
-- b : 0
-- c : 0
-- d : 0
-- e : 1
-- f : 0
-- g : 0
-- h : 1
-- i : 2
-- j : 0
-- k : 0
-- l : 0
-- m : 0
-- n : 1
-- o : 0
-- p : 1
-- q : 0
-- r : 0
-- s : 2
-- t : 1
-- u : 0
-- v : 0
-- w : 0
-- x : 0
-- y : 0
-- z : 0

import Control.Applicative ((<$>))
import qualified Control.Monad as Monad (forM_)
import qualified Data.Char as Char (toLower)
import qualified Data.List as List (sort, group)
import qualified Data.Map as Map (Map, fromList, lookup)

type AlphabetCountMap = Map.Map Char Int

main = do
    s <- getContents
    let acl = alphabetCounts $ groupAlphabet s
    Monad.forM_ ['a'..'z'] $ \c -> do
        putStrLn $ case Map.lookup c acl of
            Nothing -> c : " : 0"
            Just n  -> c : " : " ++ show n

groupAlphabet :: String -> [String]
groupAlphabet s = List.group . List.sort $ filter (\x -> x `elem` ['a'..'z']) $ Char.toLower <$> s

alphabetCounts :: [String] -> AlphabetCountMap
alphabetCounts cs = Map.fromList $ [(head c, length c) | c <- cs]

-- http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ITP1_5_B
-- Print a Frame

-- input:
-- 3 4
-- 5 6
-- 3 3
-- 2 2
-- 1 1
-- 0 0

-- output:
-- ####
-- #..#
-- ####
--
-- ######
-- #....#
-- #....#
-- #....#
-- ######
--
-- ###
-- #.#
-- ###
--
-- ##
-- ##
--
-- #
--

import Control.Applicative
import qualified Control.Monad as Monad

main = loop

loop :: IO ()
loop = do
    [h,w] <- map (read :: String -> Int) . words <$> getLine
    Monad.when (h /= 0 || w /= 0) $ do
        printFrame h w
        loop

printFrame :: Int -> Int -> IO ()
printFrame h w = do
    Monad.forM_ [1..h] $ \i -> do
        putStrLn $ frameOrDot h w i
    putStrLn ""

frameOrDot :: Int -> Int -> Int -> String
frameOrDot h w i = if (i == 1 || i == h)
                     then concat . take w $ repeat "#"
                     else "#" ++ (concat . take (w-2) $ repeat ".") ++ "#"

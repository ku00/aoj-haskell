-- http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ITP1_5_C
-- Print a Chessboard

-- input:
-- 3 4
-- 5 6
-- 3 3
-- 2 2
-- 1 1
-- 0 0

-- output:
-- #.#.
-- .#.#
-- #.#.
--
-- #.#.#.
-- .#.#.#
-- #.#.#.
-- .#.#.#
-- #.#.#.
--
-- #.#
-- .#.
-- #.#
--
-- #.
-- .#
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
        printChessboard h w
        loop

printChessboard :: Int -> Int -> IO ()
printChessboard h w = do
    Monad.forM_ [1..h] $ \i -> do
        putStrLn $ squareLine w i
    putStrLn ""

squareLine :: Int -> Int -> String
squareLine w i = if (odd i) then
                   takeSquare w "#" "."
                 else
                   takeSquare w "." "#"

takeSquare :: Int -> String -> String -> String
takeSquare w s1 s2 = take w $ concat $ zipWith (++) (repeat s1) (repeat s2)

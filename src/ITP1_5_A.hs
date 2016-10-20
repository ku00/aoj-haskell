-- http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ITP1_5_A
-- Print a Rectangle

-- input:
-- 3 4
-- 5 6
-- 2 2
-- 0 0

-- output:
-- ####
-- ####
-- ####
--
-- ######
-- ######
-- ######
-- ######
-- ######
--
-- ##
-- ##

import Control.Applicative
import qualified Control.Monad as Monad

main = loop

loop :: IO ()
loop = do
    [h,w] <- map (read :: String -> Int) . words <$> getLine
    Monad.when (h /= 0 || w /= 0) $ do
        printRectangle h w
        loop

printRectangle :: Int -> Int -> IO ()
printRectangle h w = do
    Monad.forM_ [1..h] $ \_ -> do
        putStrLn $ concat . take w $ repeat "#"
    putStrLn ""

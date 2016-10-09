-- http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ITP1_3_A
-- Print Many Hello World

-- No input

import qualified Data.Function as Function
import qualified Control.Monad as Monad

main = do
    flip Function.fix 0 $ \loop i ->
        Monad.when (i < 1000) $ do
            putStrLn "Hello World"
            loop $ i + 1

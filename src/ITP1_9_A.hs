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

import qualified Data.List as List

-- let w="computer"; t="Nurtures computer scientists and highly-skilled computer engineers who will create and exploit \"knowledge\" for the new era. Provides an outstanding computer environment."
--
-- filter (isPrefixOf w) (tails t)
-- ["computer scientists and highly-skilled computer engineers who will create and exploit \"knowledge\" for the new era. Provides an outstanding computer environment.","computer engineers who will create and exploit \"knowledge\" for the new era. Provides an outstanding computer environment.","computer environment."]
--
-- length $ filter (isPrefixOf w) (tails t)
-- 3

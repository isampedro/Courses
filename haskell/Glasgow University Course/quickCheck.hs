--stack ghci --package QuickCheck

-- for testing if ok, use quickCheck, for seeing the tests, use verboseCheck
import Data.List
import Test.QuickCheck

quickCheck ((\n -> abs n == n) :: Int -> Bool) -- should not work for negative numbers
quickCheck ((\n -> abs n == n || 0 - abs n == n) :: Int -> Bool) -- should work
quickCheck ((\l -> minimum l == sort l !! 0) :: [Int] -> Bool) -- should not work for empty lists
quickCheck ((\l -> null l || minimum l == sort l !! 0) :: [Int] -> Bool) -- should work
verboseCheck ((\l -> null l || minimum l == sort l !! 0) :: String -> Bool) -- should work

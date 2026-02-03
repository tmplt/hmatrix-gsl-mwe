module Main where

import System.Environment (getArgs)
import Test.DocTest (mainFromCabal)
import MWE (mwe)

main :: IO ()
main = putStrLn . show $ mwe

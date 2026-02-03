module Main where

import System.Environment (getArgs)
import Test.DocTest (mainFromCabal)
import MWE (mwe)

main :: IO ()
main = do
     putStrLn . show $ mwe
     mainFromCabal "mwe" =<< getArgs

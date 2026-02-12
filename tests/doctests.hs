module Main where

import System.Environment (getArgs)
import Test.DocTest (mainFromCabal)
import MWE (mwe)

main :: IO ()
main = do
     putStrLn $ "Here's an explicit invocation of mwe: " ++ (show $ mwe)
     putStrLn $ "Everything below this line is mwe via mainFromCabal:"
     mainFromCabal "mwe" =<< getArgs

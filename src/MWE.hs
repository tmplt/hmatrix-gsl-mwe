{-# OPTIONS_GHC -Wno-incomplete-patterns #-}

module MWE where

import Numeric.GSL.Root (RootMethod (Hybrids), root)

{- |

>>> mwe
[10.0]
-}
mwe :: [Double]
mwe =
    let fun [x] = [x - 10]
     in fst $ root Hybrids 0 10 fun [1]

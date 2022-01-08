module Test.Main where

import Prelude
import Effect (Effect)
import Test.Random.Noise.OpenSimplex as OpenSimplex

main :: Effect Unit
main = do
  OpenSimplex.main

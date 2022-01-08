module Test.Main where

import Prelude
import Effect (Effect)
import Test.Noise2D as Noise2D

main :: Effect Unit
main = do
  Noise2D.main

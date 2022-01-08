module Test.Random.Noise.OpenSimplex (main) where

import Prelude
import Effect (Effect)
import Test.Random.Noise.OpenSimplex.Noise2D as Noise2D

main ∷ Effect Unit
main = do
  Noise2D.main

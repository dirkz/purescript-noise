module Test.Random.Noise.OpenSimplex (main) where

import Prelude
import Effect (Effect)
import Test.Random.Noise.OpenSimplex.Noise2D as Noise2D
import Test.Random.Noise.OpenSimplex.Noise3D as Noise3D

main ∷ Effect Unit
main = do
  Noise2D.main
  Noise3D.main

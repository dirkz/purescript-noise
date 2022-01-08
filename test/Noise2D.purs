module Test.Noise2D (main) where

import Prelude
import Effect (Effect)
import Random.Noise.OpenSimplex (makeNoise2D)
import Test.QuickCheck (quickCheck)

testIdemPotence ∷ Effect Unit
testIdemPotence =
  quickCheck \seed x y ->
    let
      noise2d = makeNoise2D seed
    in
      noise2d x y == noise2d x y

main ∷ Effect Unit
main = do
  testIdemPotence

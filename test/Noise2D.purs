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

testMovingX ∷ Effect Unit
testMovingX =
  quickCheck \seed x1 x2 y ->
    let
      noise2d = makeNoise2D seed
    in
      noise2d x1 y /= noise2d x2 y

testMovingY ∷ Effect Unit
testMovingY =
  quickCheck \seed x y1 y2 ->
    let
      noise2d = makeNoise2D seed
    in
      noise2d x y1 /= noise2d x y2

main ∷ Effect Unit
main = do
  testIdemPotence
  testMovingX
  testMovingY

module Test.Random.Noise.OpenSimplex (main) where

import Prelude
import Effect (Effect)
import Random.Noise.OpenSimplex (makeNoise2D)
import Test.BigNumber (BigNumber(..))
import Test.QuickCheck (quickCheck)

testIdemPotenceInSeed ∷ Effect Unit
testIdemPotenceInSeed =
  quickCheck \(BigNumber seed) x y ->
    let
      noise1 = makeNoise2D seed

      noise2 = makeNoise2D seed
    in
      noise1 x y == noise2 x y

testIdemPotenceInXY ∷ Effect Unit
testIdemPotenceInXY =
  quickCheck \(BigNumber seed) x y ->
    let
      noise = makeNoise2D seed
    in
      noise x y == noise x y

testChangingSeed ∷ Effect Unit
testChangingSeed =
  quickCheck \(BigNumber seed1) (BigNumber seed2) x y ->
    let
      noise1 = makeNoise2D seed1

      noise2 = makeNoise2D seed2
    in
      noise1 x y == noise2 x y

testMovingX ∷ Effect Unit
testMovingX =
  quickCheck \(BigNumber seed) x1 x2 y ->
    let
      noise = makeNoise2D seed
    in
      noise x1 y /= noise x2 y

testMovingY ∷ Effect Unit
testMovingY =
  quickCheck \(BigNumber seed) x y1 y2 ->
    let
      noise = makeNoise2D seed
    in
      noise x y1 /= noise x y2

main ∷ Effect Unit
main = do
  testIdemPotenceInSeed
  testIdemPotenceInXY
  testChangingSeed
  testMovingX
  testMovingY

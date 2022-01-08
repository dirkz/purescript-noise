module Test.Random.Noise.OpenSimplex (main) where

import Prelude
import Effect (Effect)
import Random.Noise.OpenSimplex (makeNoise2D)
import Test.QuickCheck (quickCheck, (<?>))

testIdemPotenceInSeed ∷ Effect Unit
testIdemPotenceInSeed =
  quickCheck \seed x y ->
    let
      noise1 = makeNoise2D seed

      noise2 = makeNoise2D seed
    in
      noise1 x y == noise2 x y <?> "testIdemPotenceSeed"

testIdemPotenceInXY ∷ Effect Unit
testIdemPotenceInXY =
  quickCheck \seed x y ->
    let
      noise = makeNoise2D seed
    in
      noise x y == noise x y

testChangingSeed ∷ Effect Unit
testChangingSeed =
  quickCheck \seed1 seed2 x y ->
    let
      noise1 = makeNoise2D seed1

      noise2 = makeNoise2D seed2
    in
      noise1 x y /= noise2 x y <?> "testChangingSeed " <> show seed1 <> " " <> show seed2

testMovingX ∷ Effect Unit
testMovingX =
  quickCheck \seed x1 x2 y ->
    let
      noise = makeNoise2D seed
    in
      noise x1 y /= noise x2 y <?> "testMovingX"

testMovingY ∷ Effect Unit
testMovingY =
  quickCheck \seed x y1 y2 ->
    let
      noise = makeNoise2D seed
    in
      noise x y1 /= noise x y2 <?> "testMovingY"

main ∷ Effect Unit
main = do
  testIdemPotenceInSeed
  testIdemPotenceInXY
  testChangingSeed
  testMovingX
  testMovingY

module Test.Random.Noise.OpenSimplex.Noise3D (main) where

import Prelude
import Effect (Effect)
import Random.Noise.OpenSimplex (makeNoise3D)
import Test.QuickCheck (quickCheck, (<?>))

testIdemPotenceInSeed ∷ Effect Unit
testIdemPotenceInSeed =
  quickCheck \seed x y z ->
    let
      noise1 = makeNoise3D seed

      noise2 = makeNoise3D seed
    in
      noise1 x y z == noise2 x y z <?> "testIdemPotenceSeed"

testIdemPotence ∷ Effect Unit
testIdemPotence =
  quickCheck \seed x y z ->
    let
      noise = makeNoise3D seed
    in
      noise x y z == noise x y z

testChangingSeed ∷ Effect Unit
testChangingSeed =
  quickCheck \seed1 seed2 x y z ->
    let
      noise1 = makeNoise3D seed1

      noise2 = makeNoise3D seed2
    in
      noise1 x y z /= noise2 x y z <?> "testChangingSeed " <> show seed1 <> " " <> show seed2

testMovingX ∷ Effect Unit
testMovingX =
  quickCheck \seed x1 x2 y z ->
    let
      noise = makeNoise3D seed
    in
      noise x1 y z /= noise x2 y z <?> "testMovingX"

testMovingY ∷ Effect Unit
testMovingY =
  quickCheck \seed x y1 y2 z ->
    let
      noise = makeNoise3D seed
    in
      noise x y1 z /= noise x y2 z <?> "testMovingY"

testMovingZ ∷ Effect Unit
testMovingZ =
  quickCheck \seed x y z1 z2 ->
    let
      noise = makeNoise3D seed
    in
      noise x y z1 /= noise x y z2 <?> "testMovingZ"

main ∷ Effect Unit
main = do
  testIdemPotenceInSeed
  testIdemPotence
  testChangingSeed
  testMovingX
  testMovingY
  testMovingZ

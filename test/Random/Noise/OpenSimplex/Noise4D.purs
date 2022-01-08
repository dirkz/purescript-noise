module Test.Random.Noise.OpenSimplex.Noise4D (main) where

import Prelude
import Effect (Effect)
import Random.Noise.OpenSimplex (makeNoise4D)
import Test.QuickCheck (quickCheck, (<?>))

testIdemPotenceInSeed ∷ Effect Unit
testIdemPotenceInSeed =
  quickCheck \seed x y z w ->
    let
      noise1 = makeNoise4D seed

      noise2 = makeNoise4D seed
    in
      noise1 x y z w == noise2 x y z w <?> "testIdemPotenceSeed"

testIdemPotence ∷ Effect Unit
testIdemPotence =
  quickCheck \seed x y z w ->
    let
      noise = makeNoise4D seed
    in
      noise x y z w == noise x y z w

testChangingSeed ∷ Effect Unit
testChangingSeed =
  quickCheck \seed1 seed2 x y z w ->
    let
      noise1 = makeNoise4D seed1

      noise2 = makeNoise4D seed2
    in
      noise1 x y z w /= noise2 x y z w <?> "testChangingSeed " <> show seed1 <> " " <> show seed2

testMovingX ∷ Effect Unit
testMovingX =
  quickCheck \seed x1 x2 y z w ->
    let
      noise = makeNoise4D seed
    in
      noise x1 y z w /= noise x2 y z w <?> "testMovingX"

testMovingY ∷ Effect Unit
testMovingY =
  quickCheck \seed x y1 y2 z w ->
    let
      noise = makeNoise4D seed
    in
      noise x y1 z w /= noise x y2 z w <?> "testMovingY"

testMovingZ ∷ Effect Unit
testMovingZ =
  quickCheck \seed x y z1 z2 w ->
    let
      noise = makeNoise4D seed
    in
      noise x y z1 w /= noise x y z2 w <?> "testMovingZ"

testMovingW ∷ Effect Unit
testMovingW =
  quickCheck \seed x y z w1 w2 ->
    let
      noise = makeNoise4D seed
    in
      noise x y z w1 /= noise x y z w2 <?> "testMovingW"

main ∷ Effect Unit
main = do
  testIdemPotenceInSeed
  testIdemPotence
  testChangingSeed
  testMovingX
  testMovingY
  testMovingZ
  testMovingW

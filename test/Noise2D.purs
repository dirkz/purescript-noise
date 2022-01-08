module Test.Noise2D (main) where

import Prelude
import Data.Int (toNumber)
import Effect (Effect)
import Random.LCG (randomSeed, unSeed)
import Random.Noise.OpenSimplex (makeNoise2D)
import Test.QuickCheck (quickCheck)

testSameSeed ∷ Effect Unit
testSameSeed = do
  seed <- randomSeed
  let
    int = unSeed seed

    num = toNumber int
  noise2d <- makeNoise2D num
  quickCheck \x y ->
    noise2d x y == noise2d x y

testSameSeedDifferentX ∷ Effect Unit
testSameSeedDifferentX = do
  seed <- randomSeed
  let
    int = unSeed seed

    num = toNumber int
  noise2d <- makeNoise2D num
  quickCheck \x1 x2 y ->
    noise2d x1 y /= noise2d x2 y

testSameSeedDifferentY ∷ Effect Unit
testSameSeedDifferentY = do
  seed <- randomSeed
  let
    int = unSeed seed

    num = toNumber int
  noise2d <- makeNoise2D num
  quickCheck \x y1 y2 ->
    noise2d x y1 /= noise2d x y2

main ∷ Effect Unit
main = do
  testSameSeed
  testSameSeedDifferentX
  testSameSeedDifferentY

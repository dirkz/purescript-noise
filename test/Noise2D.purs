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

main ∷ Effect Unit
main = do
  testSameSeed

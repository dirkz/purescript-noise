module Test.Noise2D (main) where

import Prelude

import Control.Monad.Gen (class MonadGen)
import Data.ArrayBuffer.Typed.Gen (genFloat64)
import Effect (Effect)
import Random.Noise.OpenSimplex (makeNoise2D)
import Test.QuickCheck (quickCheckGen)

randomNoise2D :: forall m. Bind m => MonadGen m => m (Number -> Number -> Number)
randomNoise2D = do
  n <- genFloat64
  pure $ makeNoise2D n

testIdemPotence ∷ Effect Unit
testIdemPotence =
  quickCheckGen $ do
    noise2d <- randomNoise2D
    x <- genFloat64
    y <- genFloat64
    pure $ noise2d x y == noise2d x y

main ∷ Effect Unit
main = do
  testIdemPotence

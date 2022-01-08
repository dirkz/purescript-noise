module Test.BigNumber where

import Prelude

import Data.ArrayBuffer.Typed.Gen (genFloat32)
import Data.Float32 (toNumber)
import Test.QuickCheck.Arbitrary (class Arbitrary)

--|Type for floats that cover all the range, not just 0.0-1.0.
newtype BigNumber
  = BigNumber Number

--|Arbitrary instance for our "big-range" float type.
instance arbitraryBigNumber :: Arbitrary BigNumber where
  arbitrary = (BigNumber <<< toNumber) <$> genFloat32

--|Wrapper around [open simplex noise](https://www.npmjs.com/package/open-simplex-noise)
module Random.Noise.OpenSimplex
  ( makeNoise2D
  , makeNoise3D
  ) where

import Prelude
import Data.Function.Uncurried (Fn1, Fn2, Fn3, runFn1, runFn2, runFn3)

foreign import _makeNoise2D :: Fn1 Int (Fn2 Number Number Number)

--|Given an arbitrary seed number, returns a 2D noise function.
makeNoise2D ∷ Int → (Number → Number → Number)
makeNoise2D = runFn2 <<< runFn1 _makeNoise2D

foreign import _makeNoise3D :: Fn1 Int (Fn3 Number Number Number Number)

--|Given an arbitrary seed number, returns a 3D noise function.
makeNoise3D ∷ Int → (Number → Number → Number -> Number)
makeNoise3D = runFn3 <<< runFn1 _makeNoise3D

--|Wrapper around [open simplex noise](https://www.npmjs.com/package/open-simplex-noise)
module Random.Noise.OpenSimplex
  ( makeNoise2D
  , makeNoise3D
  , makeNoise4D
  ) where

import Prelude
import Data.Function.Uncurried (Fn1, Fn2, Fn3, Fn4, runFn1, runFn2, runFn3, runFn4)

foreign import _makeNoise2D :: Fn1 Int (Fn2 Number Number Number)

--|Given an arbitrary seed integer, returns a 2D noise function.
makeNoise2D ∷ Int → (Number → Number → Number)
makeNoise2D = runFn2 <<< runFn1 _makeNoise2D

foreign import _makeNoise3D :: Fn1 Int (Fn3 Number Number Number Number)

--|Given an arbitrary seed integer, returns a 3D noise function.
makeNoise3D ∷ Int → (Number → Number → Number -> Number)
makeNoise3D = runFn3 <<< runFn1 _makeNoise3D

foreign import _makeNoise4D :: Fn1 Int (Fn4 Number Number Number Number Number)

--|Given an arbitrary seed integer, returns a 4D noise function.
makeNoise4D ∷ Int → (Number → Number → Number -> Number -> Number)
makeNoise4D = runFn4 <<< runFn1 _makeNoise4D

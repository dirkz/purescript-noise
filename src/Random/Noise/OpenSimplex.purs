module Random.Noise.OpenSimplex where

import Data.Function.Uncurried (Fn1, Fn2, runFn1, runFn2)

foreign import _makeNoise2D :: Fn1 Number (Fn2 Number Number Number)

makeNoise2D ∷ Number → (Number → Number → Number)
makeNoise2D seed = runFn2 (runFn1 _makeNoise2D seed)

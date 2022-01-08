module Random.Noise.OpenSimplex where

import Prelude
import Data.Function.Uncurried (Fn2, runFn2)
import Effect (Effect)
import Effect.Uncurried (EffectFn1, runEffectFn1)

foreign import _makeNoise2D :: EffectFn1 Number (Fn2 Number Number Number)

makeNoise2D ∷ Number → Effect (Number → Number → Number)
makeNoise2D seed = runFn2 <$> (runEffectFn1 _makeNoise2D seed)

module Module2 where

import Prelude
import Data.Maybe (Maybe)
import Math (sqrt, pi)
import Global (toFixed)

diagonal :: Number -> Number -> Number
diagonal width lenght = sqrt (width * width + lenght * lenght)

circleArea :: Number -> Maybe String
circleArea radius = toFixed 2 (pi * radius * radius)

module Test.Module2 where

import Data.Maybe (Maybe(..))
import Effect (Effect)
import Module2 (circleArea, diagonal)
import Prelude (Unit, (==))
import Test.Assert (assert)

diagonalTest :: Effect Unit
diagonalTest = do
  assert
    ( diagonal 3.0 4.0
        == 5.0
    )

circleAreaTest :: Effect Unit
circleAreaTest = do
  assert (circleArea 3.0 == Just "28.27")

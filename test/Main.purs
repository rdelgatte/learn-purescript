module Test.Main where

import Effect (Effect)
import Prelude (Unit, discard)
import Test.Data.AddressBook (findEntryByCityTest, findEntryEmptyTest, findEntryTest, showTest, existNameTest, removeDuplicateTest)
import Test.Module2 (circleAreaTest, diagonalTest)

main :: Effect Unit
main = do
  circleAreaTest
  diagonalTest
  showTest
  findEntryTest
  findEntryEmptyTest
  findEntryByCityTest
  existNameTest
  removeDuplicateTest

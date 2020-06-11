module Test.Data.AddressBook where

import Data.AddressBook (Address, AddressBook, Entry, emptyBook, existName, findEntry, findEntryByCity, insertEntry, removeDuplicates, show)
import Data.Maybe (Maybe(..))
import Effect (Effect)
import Prelude (Unit, (==))
import Test.Assert (assert)

address :: Address
address = { street: "7 rue Marcel Wantiez", city: "Merville", state: "France" }

entry :: Entry
entry = { firstName: "Rémi", lastName: "Delgatte", address }

addressBook :: AddressBook
addressBook = insertEntry entry emptyBook

showTest :: Effect Unit
showTest = do
  assert (show entry == "Rémi Delgatte - 7 rue Marcel Wantiez Merville - France")

findEntryTest :: Effect Unit
findEntryTest = do
  assert
    ( findEntry "Rémi" "Delgatte" addressBook
        == Just entry
    )

findEntryEmptyTest :: Effect Unit
findEntryEmptyTest =
  assert
    ( findEntry "anyThing" "anyThing" emptyBook == Nothing
    )

findEntryByCityTest :: Effect Unit
findEntryByCityTest = do
  assert
    ( findEntryByCity "Merville" addressBook
        == Just entry
    )

existNameTest :: Effect Unit
existNameTest = do
  assert
    ( existName "Delgatte" addressBook
        == true
    )

existNameUnknownTest :: Effect Unit
existNameUnknownTest = do
  assert
    ( existName "Delgatte" emptyBook
        == true
    )

removeDuplicateTest :: Effect Unit
removeDuplicateTest = do
  assert
    ( removeDuplicates (insertEntry entry addressBook)
        == addressBook
    )

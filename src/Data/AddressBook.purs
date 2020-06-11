module Data.AddressBook where

import Prelude
import Control.Plus (empty)
import Data.List (List(..), filter, head, null, nubBy)
import Data.Maybe (Maybe)

type AddressBook
  = List Entry

type Entry
  = { firstName :: String
    , lastName :: String
    , address :: Address
    }

type Address
  = { street :: String
    , city :: String
    , state :: String
    }

show :: Entry -> String
show entry = entry.firstName <> " " <> entry.lastName <> " - " <> showAddress entry.address

showAddress :: Address -> String
showAddress address = address.street <> " " <> address.city <> " - " <> address.state

emptyBook :: AddressBook
emptyBook = empty

insertEntry :: Entry -> AddressBook -> AddressBook
insertEntry = Cons

findEntryByCity :: String -> AddressBook -> Maybe Entry
findEntryByCity city = head   <<< filter filterEntry
  where
  filterEntry :: Entry -> Boolean
  filterEntry entry = entry.address.city == city

findEntry :: String -> String -> AddressBook -> Maybe Entry
findEntry firstname lastname = head <<< filter filterEntry
  where
  filterEntry :: Entry -> Boolean
  filterEntry entry = entry.firstName == firstname && entry.lastName == lastname

existName :: String -> AddressBook -> Boolean
existName lastname = not <<< null <<< filter filterEntry
  where
  filterEntry :: Entry -> Boolean
  filterEntry entry = entry.lastName == lastname

removeDuplicates :: AddressBook -> AddressBook
removeDuplicates = nubBy (\entry1 entry2 -> entry1.lastName == entry2.lastName && entry1.firstName == entry2.firstName)

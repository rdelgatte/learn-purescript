module Main where

import Data.AddressBook
import Effect (Effect)
import Effect.Console (logShow)
import Prelude (Unit)

main :: Effect Unit
main = logShow (show entry)
  where
  address = { street: "7 rue Marcel Wantiez", city: "Merville", state: "France" }

  entry = { firstName: "Rémi", lastName: "Delgatte", address }
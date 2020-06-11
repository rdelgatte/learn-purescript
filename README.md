# Learn Purescript

This project compiles the result of my learning from [Purescript by example book](https://leanpub.com/purescript/read#leanpub-auto-hello-purescript).

# 1. Introduction

# 2. Getting Started

Another way of dealing with Purescript projects is using `Pulp` and `Bower` instead of Spago so the application can be run, tested and compiled to Javascript which can be injected into an HTML `<script type="text/javascript" src="output.js"></script>` afterwards.

I kept using Spago for the project and used: 
- `Math` module to use `sqrt` and `pi` functions
- `Global` module to use `toFixed` so it prints the result number with a specific precision
- `Assert` module for tests assertions 

When testing, I had to use `Prelude(discard)` so I can run multiple test functions as below: 

```purescript
main :: Effect Unit
main = do
  diagonalTest
  circleAreaTest
```

# 3. Functions and Records

In this section, I created first record data types `Entry` and `Adress` so I could play around with CRUD functions to interact with these types. 

## Exercices

See module [Data.AddressBook](src/Data/AddressBook.purs) and its [tests module](test/Data/AddressBook.purs).

## Learnings 

- Type aliases and data types are defined the same way as in Haskell 
```purescript
type AddressBook
  = List Entry

type Address
  = { street :: String
    , city :: String
    , state :: String
    }
```
- `<<<` is the infix operator (equivalent to `<|` in Elm) and get its opposite `>>>`
- `entry.address.city` to access entry's adress city. In haskell, it would have been `city $ adress entry`
- Eta reduction works the same way as in Elm / Haskell: 
```purescript
insertEntry :: Entry -> AddressBook -> AddressBook
insertEntry entry adressBook = Cons entry adressBook 

insertEntry :: Entry -> AddressBook -> AddressBook
insertEntry entry = Cons entry 

insertEntry :: Entry -> AddressBook -> AddressBook
insertEntry = Cons
```
{-# LANGUAGE NoImplicitPrelude, QuasiQuotes, DataKinds #-}
module Main where

import BasePrelude
import Record
import Record.Lens


main =
  return ()


type Person = 
  [record| {name :: String, birthday :: {year :: Int, month :: Int, day :: Int}} |]

type Event =
  [record| {name :: String, date :: {year :: Int, month :: Int, day :: Int}} |]

person :: Person
person =
  [record| {name = "Simon Peyton Jones", 
            birthday = {year = 1958, month = 1, day = 18}} |]

getPersonBirthdayYear :: Person -> Int
getPersonBirthdayYear =
  view [lens|birthday.year|]

setPersonBirthdayYear :: Int -> Person -> Person
setPersonBirthdayYear =
  set [lens|birthday.year|]

personBirthdayYearLens :: Lens Person Int
personBirthdayYearLens =
  [lens|birthday.year|]

personBirthdayYearLens' :: Lens Person Int
personBirthdayYearLens' =
  [lens|birthday|] . [lens|year|]

tupleLens :: Lens (Int, Char, String) String
tupleLens =
  [lens|3|]

mapThirdElement :: (Char -> Char) -> (Int, String, Char) -> (Int, String, Char)
mapThirdElement =
  over [lens|3|]

functionOnARecord :: [record| {name :: String, age :: [Int]}|] -> [Int]
functionOnARecord =
  view [lens|age|]

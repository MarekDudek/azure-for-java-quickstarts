module Main where

import Lib
import System.Command

main :: IO ()
main = do
  cmd "kubectl config view"
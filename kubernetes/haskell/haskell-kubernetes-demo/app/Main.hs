{-# LANGUAGE OverloadedStrings #-}
module Main where

import Lib
import System.Command
import qualified Data.Yaml as Y

main :: IO ()
main = do
  --Stdout out <- cmd "kubectl create deployment rest-server --image marekdudek/rest-server --port 8082 -o yaml --dry-run=client"
  --writeFile "./out/rest-server-deployment.yaml" out
  decodeDeployment
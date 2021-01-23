module Main where

import System.Command

main :: IO ()
main = do
  Stdout out <- cmd "kubectl create deployment rest-server --image marekdudek/rest-server --port 8082 -o yaml --dry-run=client"
  writeFile "./out/rest-server-deployment.yaml" out
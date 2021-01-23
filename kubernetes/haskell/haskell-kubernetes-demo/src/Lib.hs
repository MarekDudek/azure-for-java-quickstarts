{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE DeriveGeneric #-}


module Lib
    ( decodeDeployment
    ) where

import qualified Data.Yaml as Y
import Data.Yaml.Aeson
import Text.RawString.QQ
import Data.ByteString (ByteString)
import System.IO
import GHC.Generics
import Data.Aeson
import qualified Data.ByteString.Lazy.UTF8 as BLU

configYaml :: ByteString
configYaml = [r|
resolver: lts-3.7
packages:
  - ./yesod-core
  - ./yesod-static
  - ./yesod-persistent
  - ./yesod-newsfeed
  - ./yesod-form
  - ./yesod-auth
  - ./yesod-auth-oauth
  - ./yesod-sitemap
  - ./yesod-test
  - ./yesod-bin
  - ./yesod
  - ./yesod-eventsource
  - ./yesod-websockets

# Needed for LTS 2
extra-deps:
- wai-app-static-3.1.4.1
|]


decodeDeployment :: IO ()
decodeDeployment = do
  putStrLn "Decoding Deployment"
  handle <- openFile "src/deployment.yaml" ReadMode
  contents <- hGetContents handle
  print contents
  let contentsBS :: ByteString = "apiVersion: apps/v1\nkind: Deployment"
  res <- Y.decodeThrow contentsBS
  print (res :: Deployment)
  Y.encodeFile "src/deployment2.yaml" res



data Deployment =
  Deployment {
    apiVersion :: String,
    kind :: String
  } deriving (Eq, Show, Generic)

instance FromJSON Deployment --where

instance Y.ToJSON Deployment where
  toEncoding = genericToEncoding defaultOptions

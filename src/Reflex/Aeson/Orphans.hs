{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE StandaloneDeriving #-}
module Reflex.Aeson.Orphans () where

import Data.Aeson
import Data.AppendMap
import qualified Data.Map as Map
import Reflex

instance (ToJSON k, ToJSON m) => ToJSON (AppendMap k m) where
  toJSON = toJSON . Map.toList . _unAppendMap

instance (FromJSON k, FromJSON m, Ord k) => FromJSON (AppendMap k m) where
  parseJSON r = do
    res <- parseJSON r
    fmap AppendMap . sequence . Map.fromListWithKey (fail "duplicate key in JSON deserialization of AppendMap") . fmap (fmap return) $ res

deriving instance FromJSON SelectedCount
deriving instance ToJSON SelectedCount

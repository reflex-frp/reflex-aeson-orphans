{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE StandaloneDeriving #-}
module Reflex.Aeson.Orphans () where

import Data.Aeson
import Data.Map.Monoidal (MonoidalMap (..))
import qualified Data.Map as Map
import Reflex

instance (ToJSON k, ToJSON m) => ToJSON (MonoidalMap k m) where
  toJSON = toJSON . Map.toList . getMonoidalMap

instance (FromJSON k, FromJSON m, Ord k) => FromJSON (MonoidalMap k m) where
  parseJSON r = do
    res <- parseJSON r
    fmap MonoidalMap . sequence . Map.fromListWithKey (fail "duplicate key in JSON deserialization of AppendMap") . fmap (fmap return) $ res

deriving instance FromJSON SelectedCount
deriving instance ToJSON SelectedCount

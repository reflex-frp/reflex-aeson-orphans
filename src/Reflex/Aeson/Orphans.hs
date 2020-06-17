{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE UndecidableInstances #-}

module Reflex.Aeson.Orphans () where

import Data.Aeson
import Data.Dependent.Map (DMap)
import Data.Foldable (toList)
import Data.Functor.Misc
import Data.Maybe (listToMaybe)
import Reflex

deriving instance FromJSON SelectedCount
deriving instance ToJSON SelectedCount

instance ToJSON (f a) => ToJSON (ComposeMaybe f a) where
  toJSON = toJSON . toList . getComposeMaybe
instance FromJSON (f a) => FromJSON (ComposeMaybe f a) where
  parseJSON v = ComposeMaybe . listToMaybe <$> parseJSON v

deriving instance
  ( ToJSON (DMap k (ComposeMaybe v))
  ) => ToJSON (PatchDMap k v)

deriving instance
  ( FromJSON (DMap k (ComposeMaybe v))
  ) => FromJSON (PatchDMap k v)

deriving instance (ToJSONKey k, ToJSON v) => ToJSON (PatchMap k v)
deriving instance (Ord k, FromJSONKey k, FromJSON v) => FromJSON (PatchMap k v)


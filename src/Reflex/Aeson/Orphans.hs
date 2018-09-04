{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE StandaloneDeriving #-}
module Reflex.Aeson.Orphans () where

import Data.Aeson
import Data.Map.Monoidal (MonoidalMap (..))
import qualified Data.Map as Map
import Reflex

deriving instance FromJSON SelectedCount
deriving instance ToJSON SelectedCount

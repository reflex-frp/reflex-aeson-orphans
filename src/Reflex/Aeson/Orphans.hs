{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE StandaloneDeriving #-}
module Reflex.Aeson.Orphans () where

import Data.Aeson
import Reflex

deriving instance FromJSON SelectedCount
deriving instance ToJSON SelectedCount

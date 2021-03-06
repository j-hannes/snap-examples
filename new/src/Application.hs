{-# LANGUAGE TemplateHaskell #-}

------------------------------------------------------------------------------
-- | This module defines our application's state type and an alias for its
-- handler monad.
module Application where

------------------------------------------------------------------------------
import Data.Lens.Template
import Snap.Snaplet
import Snap.Snaplet.Heist

------------------------------------------------------------------------------
data App = App
    { _heist :: Snaplet (Heist App)
    }

makeLens ''App

instance HasHeist App where
    heistLens = subSnaplet heist


------------------------------------------------------------------------------
type AppHandler = Handler App App

module Player
( Player
) where

import Maths (IVec)

data Player = Player {
    pos :: IVec,
    hp :: Int
} deriving Show

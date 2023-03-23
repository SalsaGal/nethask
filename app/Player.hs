module Player
( Player
, newPlayer
) where

import Maths (Vec2)

data Player = Player {
    pos :: Vec2 Int,
    hp :: Int
} deriving Show

newPlayer :: Vec2 Int -> Player
newPlayer pos = Player {
        pos=pos,
        hp=10
    }

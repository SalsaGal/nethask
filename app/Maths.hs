module Maths where

data Vec2 a = Vec2 {x :: a, y :: a} deriving Show

(+) :: (Num a) => Vec2 a -> Vec2 a -> Vec2 a
(+) a b = Vec2 { x=x a Prelude.+ x b, y=y a Prelude.+ y b }

(-) :: (Num a) => Vec2 a -> Vec2 a -> Vec2 a
(-) a b = Vec2 { x=x a Prelude.- x b, y=y a Prelude.- y b }

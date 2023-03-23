module Main where

import Game
import System.IO (hSetBuffering, BufferMode (NoBuffering), stdin)

main :: IO ()
main = do
    hSetBuffering stdin NoBuffering
    gameLoop newState

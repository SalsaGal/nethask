module Game
( gameLoop
, newState
) where

import System.Console.ANSI (clearScreen, setCursorPosition)
import Player (Player)

gameLoop :: State -> IO ()
gameLoop s = do
    clearScreen
    setCursorPosition 0 0
    putStrLn (displayLevel (head (levels s)))
    action <- getChar
    case action of
        'q' -> do
            clearScreen
            setCursorPosition 0 0
            putStrLn "Really quit? (y/n)"
            action <- getChar
            if action == 'y'
                then clearScreen
                else gameLoop s
        _ -> gameLoop s

data State = State {
        levels :: [Level],
        player :: Player
    } deriving Show

newState :: State
newState = State {
        levels=[
            Level {
                grounds=[
                    [Grass, Grass, Stone],
                    [Grass, Stone, Stone]
                ]
            }
        ]
    }

data Level = Level {
        grounds :: [[Ground]]
    } deriving Show

displayLevel :: Level -> String
displayLevel level = foldl (\acc line -> acc ++ line ++ "\n") "" (map (map groundChar) (grounds level))

data Ground = Grass | Stone deriving Show

groundChar :: Ground -> Char
groundChar Grass = '"'
groundChar Stone = '+'

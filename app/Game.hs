module Game
( gameLoop
, newState
) where

import System.Console.ANSI (clearScreen)

gameLoop :: State -> IO ()
gameLoop s = clearScreen >> putStrLn (displayLevel (level s))

newtype State = State {
        level :: Level
    } deriving Show

newState :: State
newState = State {level=Level {
        grounds=[
            [Grass, Grass, Stone],
            [Grass, Stone, Stone]
        ]
    }}

newtype Level = Level {
        grounds :: [[Ground]]
    } deriving Show

displayLevel :: Level -> String
displayLevel level = foldl (\acc line -> acc ++ line ++ "\n") "" (map (map groundChar) (grounds level))

data Ground = Grass | Stone deriving Show

groundChar :: Ground -> Char
groundChar Grass = '"'
groundChar Stone = '+'

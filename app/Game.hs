module Game
( gameLoop
, newState
) where

import System.Console.ANSI (clearScreen, setCursorPosition)

gameLoop :: State -> IO ()
gameLoop s = do
    clearScreen
    setCursorPosition 0 0
    putStrLn (displayLevel (level s))
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

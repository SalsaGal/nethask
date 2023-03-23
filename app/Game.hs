module Game
( gameLoop
, newState
) where

gameLoop :: State -> IO ()
gameLoop s = putStrLn (displayLevel (level s))

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
displayLevel level = map groundChar (head (grounds level))

data Ground = Grass | Stone deriving Show

groundChar :: Ground -> Char
groundChar Grass = '"'
groundChar Stone = '+'

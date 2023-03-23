module Game where

gameLoop :: State -> State

data State = State {
        level :: Level
    }

newState :: State
newState = State {level=Level {
        grounds=[[Grass]]
    }}

data Level = Level {
        grounds :: [[Ground]]
    }

data Ground = Grass | Stone

groundChar :: Ground -> Char
groundChar Grass = '"'
groundChar Stone = '+'

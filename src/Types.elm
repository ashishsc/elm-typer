module Types exposing (..)


type alias Model =
    { fullText : String
    , curText : String
    }


type Msg
    = Tick

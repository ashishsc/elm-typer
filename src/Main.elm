module Main exposing (..)

import Html
import String
import Time
import Types exposing (..)
import View exposing (view, viewWithTerminal)


init : ( Model, Cmd Msg )
init =
    ( { fullText = "I'm really typing, I'm doing it!", curText = "" }, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Tick ->
            if model.curText == model.fullText then
                ( model, Cmd.none )
            else
                -- Get the next letter and add it to the current string
                ( { model
                    | curText = String.slice 0 (String.length model.curText + 1) model.fullText
                  }
                , Cmd.none
                )


tickSub : Model -> Sub Msg
tickSub model =
    Time.every (150 * Time.millisecond) (\_ -> Tick)


main : Program Never Model Msg
main =
    Html.program
        { view = viewWithTerminal
        , init = init
        , update = update
        , subscriptions = tickSub
        }

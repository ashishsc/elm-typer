module View exposing (view, viewWithTerminal)

import Html exposing (..)
import Html.Attributes exposing (..)
import String
import Types exposing (..)


terminalStyle : List ( String, String )
terminalStyle =
    [ ( "backgroundColor", "#002b36" )
    , ( "color", "white" )
    , ( "width", "400px" )
    , ( "height", "200px" )
    , ( "font-size", "10px" )
    ]


view : Model -> Html msg
view model =
    main_ [] [ text model.curText ]


viewWithTerminal : Model -> Html msg
viewWithTerminal model =
    main_ [] [ terminalView "~/dev" model.curText ]


prompt : String -> Html msg
prompt promptText =
    let
        dir =
            if String.isEmpty promptText then
                ""
            else
                "(" ++ promptText ++ ")"
    in
    span [] [ text ("$ " ++ dir ++ " > ") ]


terminalView : String -> String -> Html msg
terminalView promptText typedText =
    div [ style terminalStyle ] [ prompt promptText, span [] [ text typedText ] ]

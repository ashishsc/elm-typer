module View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


view : Model -> Html msg
view model =
    main_ [] [ text model.curText ]

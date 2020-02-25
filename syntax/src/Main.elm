module Main exposing (main)

import Browser as B
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)



-- this is our main function


main =
    B.sandbox { init = init, update = update, view = view }



{- This is our model
   that has only one attribute
-}


type alias Model =
    { clicks : Int
    }


type Msg
    = ClickButton


init : Model
init =
    Model 0


update : Msg -> Model -> Model
update msg model =
    case msg of
        ClickButton ->
            { model | clicks = model.clicks + 1 }


view : Model -> Html Msg
view model =
    div [ class "container" ]
        [ h1 [] [ text "Clicks counter app" ]
        , text ("Number of times button has been clicked: " ++ String.fromInt model.clicks)
        , button [ onClick <| ClickButton ] [ text "click me" ]
        ]

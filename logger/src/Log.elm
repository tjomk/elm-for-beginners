module Log exposing (main)

import Browser
import Html exposing (Html, br, button, div, h1, p, text, textarea)
import Html.Attributes exposing (class, style, value)
import Html.Events exposing (onClick, onInput)



{-
   we use `sandbox` to create a simple webapp that
   can react to user input and doesn't communicate
   with the external world, ie. perform ajax calls
-}


main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }



{-
   This is our model. Think of it as your local database
   where we will keep all the information. We to store a
   list of entries, and the text that user is currently
   typing.
-}


type alias Model =
    { entries : List String
    , data : String
    }


type Msg
    = SubmitEntry
    | InputUpdate String


init : Model
init =
    Model [] ""


update : Msg -> Model -> Model
update msg model =
    case msg of
        SubmitEntry ->
            { model | entries = model.entries ++ [ model.data ], data = "" }

        InputUpdate userInput ->
            { model | data = userInput }


renderEntry : String -> Html Msg
renderEntry entry =
    p [] [ text entry ]


view : Model -> Html Msg
view model =
    div [ style "margin" "1rem" ]
        [ h1 [ class "h1" ] [ text "Daily Journal" ]
        , textarea [ value model.data, onInput InputUpdate ] []
        , div []
            [ button [ onClick SubmitEntry ] [ text "Add entry" ]
            ]
        , div [] (List.map renderEntry model.entries)
        ]

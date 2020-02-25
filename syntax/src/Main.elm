module Main exposing (main)

import Browser as B
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)



-- This is our main function. It describes our application
-- and what gets rendered on the screen. We use `Browser.sanbox`
-- function since we don't need any event listeners or ajax
-- requests.


main =
    B.sandbox { init = init, update = update, view = view }



{- This is our model, it describes which data we are going to
   store and use. For this example we just count clicks. The
   use of the record type here is intentional for learning
   experience, however for a single attribute like `clicks`
   we could have simplified the model to just `Int` type:
   `type alias Model = Int`.
-}


type alias Model =
    { clicks : Int
    }



-- This is the message the our view code will send to the
-- update function whenever some event happens. We want to
-- track a single event only, however it is common to have
-- lots of different types here, e.g. form submit, data
-- received, and so on.


type Msg
    = ClickButton



{- The init function that we pass to the `Browser.sandbox`.
   This initializes the state of the application, i.e. the
   first time our code gets rendered on the screen, what
   values are we going to use/show the user.
-}


init : Model
init =
    Model 0



{- Update function is used to update our model. It is triggered
   by various events that we handle here and update data
   accordingly. Some of these events can be button clicks or
   key presses, others can be API responses or scheduled events.
-}


update : Msg -> Model -> Model
update msg model =
    case msg of
        ClickButton ->
            { model | clicks = model.clicks + 1 }



{- Finally the view function describes the UI that we see on the
   screen. It receives a model and outputs HTML. Button
   element fires the `ClickButton` message when the user clicks it.
-}


view : Model -> Html Msg
view model =
    div [ class "container" ]
        [ h1 [] [ text "Clicks counter app" ]
        , text ("Number of times button has been clicked: " ++ String.fromInt model.clicks)
        , button [ onClick <| ClickButton ] [ text "click me" ]
        ]

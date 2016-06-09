module Marbles exposing (Msg, model, view, update, subscriptions)

import Time exposing (Time, second)
import Html exposing (..)
import Html.Attributes exposing (..)


model =
    { x = 0, y = 0 }


view model =
    div [ style [ ( "color", "red" ) ] ]
        [ text <| toString model ]


type Msg
    = Tick Time


update msg ({ x } as model) =
    { model | x = x + 1 }


subscriptions model =
    Time.every second Tick

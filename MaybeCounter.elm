module MaybeCounter exposing (Msg, model, view, update)

import Html exposing (..)
import Html.Events exposing (..)


model =
    Just 0


type Msg
    = Increment
    | Decrement
    | Nothingify


view model =
    let
        value =
            case model of
                Just number ->
                    toString number

                Maybe.Nothing ->
                    "Oh no!"
    in
        div []
            [ text value
            , pre []
                [ text <| toString model ]
            , button [ onClick Decrement ] [ text "-" ]
            , button [ onClick Increment ] [ text "+" ]
            , button [ onClick Nothingify ] [ text "Nothingify" ]
            ]


update msg model =
    case msg of
        Nothingify ->
            Nothing

        Decrement ->
            Maybe.map (\x -> x - 1) model

        Increment ->
            Maybe.map (\x -> x + 1) model

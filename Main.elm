module Main exposing (main)

import Html exposing (div)
import Html.App as App exposing (program)
import Html.Attributes exposing (style)
import Marbles
import MaybeCounter


main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


init =
    ( model, Cmd.none )


model =
    { counter = MaybeCounter.model
    , marbles = Marbles.model
    }


type Msg
    = TopCounter MaybeCounter.Msg
    | BottomMarbles Marbles.Msg


view model =
    let
        blockStyle =
            [ ( "border", "1px solid" )
            , ( "padding", "10px" )
            ]
    in
        div []
            [ div [ style <| blockStyle ++ [ ( "margin-bottom", "10px" ) ] ]
                [ App.map TopCounter (MaybeCounter.view model.counter) ]
            , div [ style blockStyle ]
                [ App.map BottomMarbles (Marbles.view model.marbles) ]
            ]


update msg model =
    ( case msg of
        TopCounter msg ->
            { model | counter = MaybeCounter.update msg model.counter }

        BottomMarbles msg ->
            { model | marbles = Marbles.update msg model.marbles }
    , Cmd.none
    )


subscriptions model =
    Sub.map BottomMarbles <| Marbles.subscriptions model.marbles

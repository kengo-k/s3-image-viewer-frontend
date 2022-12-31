module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (type_, value)
import Html.Events exposing (onClick)


type Msg
    = CountUp
    | CountDown


type alias Model =
    { value : Int }


update : Msg -> Model -> Model
update msg model =
    case msg of
        CountUp ->
            { model | value = model.value + 1 }

        CountDown ->
            { model | value = model.value - 1 }


view : Model -> Html Msg
view model =
    div []
        [ input [ type_ "number", value (String.fromInt model.value) ]
            []
        , button
            [ onClick CountUp ]
            [ text "+1" ]
        , button
            [ onClick CountDown ]
            [ text "-1" ]
        ]


main : Program () Model Msg
main =
    Browser.sandbox { init = { value = 0 }, update = update, view = view }

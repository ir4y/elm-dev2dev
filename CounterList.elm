module CounterList exposing (..)

import Html exposing (Html, text, h2, button, div, p, input, br)
import Html.Events exposing (onClick, onInput)
import Html.Attributes exposing (value)
import Counter


type alias Model =
    List Counter.Model


init : Model
init =
    []


type Msg
    = AddCounter
    | CounterMsg Int Counter.Msg


update : Msg -> Model -> Model
update msg model =
    case msg of
        AddCounter ->
            Counter.init :: model

        CounterMsg index counterMsg ->
            List.indexedMap
                (\counterIndex counter ->
                    if index == counterIndex then
                        Counter.update counterMsg counter
                    else
                        counter
                )
                model


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick AddCounter ] [ text "add counter" ]
        , div []
            (List.indexedMap
                (\index item -> Html.map (CounterMsg index) (Counter.view item))
                model
            )
        ]


main =
    Html.beginnerProgram
        { model = init
        , update = update
        , view = view
        }

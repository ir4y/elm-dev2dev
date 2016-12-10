module Counter exposing (..)

import Html exposing (Html, text, h2, button, div, p, input, br)
import Html.Events exposing (onClick, onInput)
import Html.Attributes exposing (value)


main =
    Html.beginnerProgram
        { model = init
        , update = update
        , view = view
        }


type alias Model =
    { count : Int
    , title : String
    }


init : Model
init =
    { count = 0, title = "" }


type Msg
    = Dec
    | Inc
    | SetTitle String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Dec ->
            { model | count = model.count - 1 }

        Inc ->
            { model | count = model.count + 1 }

        SetTitle title ->
            { model | title = title }


view : Model -> Html Msg
view model =
    div []
        [ h2 [] [ text model.title ]
        , input [ value model.title, onInput SetTitle ] []
        , br [] []
        , button [ onClick Dec ] [ text "-" ]
        , p [] [ text (toString model.count) ]
        , button [ onClick Inc ] [ text "+" ]
        ]

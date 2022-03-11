module Main exposing (main)

import Browser
import Html
import Html.Events
import Json.Decode


type alias Model =
    { value : Int
    }


main : Program () Model Int
main =
    Browser.sandbox
        { init = Model 0
        , view =
            \{ value } ->
                Html.div []
                    [ Html.button
                        [ Html.Events.on "click" <|
                            Json.Decode.succeed <|
                                value
                                    + 1
                        ]
                        [ Html.text "A" ]
                    , Html.button
                        [ Html.Events.on "click" <|
                            Json.Decode.oneOf
                                [ Json.Decode.succeed <| value + 1
                                ]
                        ]
                        [ Html.text "B" ]
                    , Html.text <| "Value: " ++ String.fromInt value
                    ]
        , update =
            \msg model ->
                { model | value = msg }
        }

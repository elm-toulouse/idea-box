module SuggestionList exposing (..)

import Data exposing (Suggestion)
import Element exposing (Element, column, el, fill, padding, px, row, spacing, text, width)
import Element.Font as Font


renderSuggestionList : List Suggestion -> Element msg
renderSuggestionList suggestions =
    column [ width fill, padding 15, spacing 15 ]
        (List.map renderSuggestion suggestions)


renderSuggestion : Suggestion -> Element msg
renderSuggestion suggestion =
    row [ width fill ]
        [ el [ Font.center, width (px 50) ] (suggestion.votes |> String.fromInt |> text)
        , column [ width fill ]
            [ el [ Font.size 28 ] (text suggestion.title)
            , el [ Font.size 20 ] (text suggestion.description)
            , el [ Font.alignRight, width fill ] (text suggestion.author)
            ]
        ]

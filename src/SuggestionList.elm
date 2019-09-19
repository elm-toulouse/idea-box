module SuggestionList exposing (..)

import Data exposing (..)
import Element exposing (Element, column, el, text)


renderSuggestionList : List Suggestion -> Element msg
renderSuggestionList suggestions =
    column []
        (List.map renderSuggestion suggestions)


renderSuggestion : Suggestion -> Element msg
renderSuggestion suggestion =
    el [] (text suggestion.title)

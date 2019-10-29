module Search exposing (..)

import Data exposing (Suggestion)
import Fuzzy exposing (match)


simpleMatch config separators needle hay =
    match config separators needle (String.map Char.toLower hay.title) |> .score


scoreSuggestion : String -> Suggestion -> ( Suggestion, Int )
scoreSuggestion input suggestion =
    ( suggestion, simpleMatch [] [ " ", "," ] (String.map Char.toLower input) suggestion )


filterSortSuggestions : Int -> String -> List Suggestion -> List Suggestion
filterSortSuggestions threshold input suggestions =
    let
        scores =
            List.map (simpleMatch [] [ " ", "," ] (String.map Char.toLower input)) suggestions

        suggestionsWithScore =
            List.map (\x -> scoreSuggestion input x) suggestions

        filtered =
            List.filter (\x -> Tuple.second x < threshold) suggestionsWithScore

        sorted =
            List.sortBy Tuple.second filtered
    in
    List.map Tuple.first sorted

module Main exposing (main, myElement, myRowOfStuff)

import Data exposing (suggestionList)
import Element exposing (Element, alignRight, centerY, column, el, fill, padding, rgb255, row, spacing, text, width)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import SuggestionList exposing (renderSuggestionList)


main =
    Element.layout []
        page


page : Element msg
page =
    column [ width fill ]
        [ myRowOfStuff
        , renderSuggestionList suggestionList
        ]


myRowOfStuff : Element msg
myRowOfStuff =
    row [ width fill, Element.alignTop, spacing 30, Background.color (rgb255 191 100 114) ]
        [ myElement
        , myElement
        , el [ alignRight ] myElement
        ]


myElement : Element msg
myElement =
    el
        [ Background.color (rgb255 240 0 245)
        , Font.color (rgb255 255 255 255)
        , Border.rounded 3
        , padding 10
        ]
        (text "stylish!")

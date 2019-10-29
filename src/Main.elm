module Main exposing (main, myElement, myRowOfStuff)

import Browser
import Data exposing (suggestionList)
import Element exposing (Element, alignRight, centerY, column, el, fill, height, padding, paddingXY, rgb255, row, spacing, text, width)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import Search exposing (filterSortSuggestions)
import SuggestionList exposing (renderSuggestionList)


main =
    Browser.sandbox { init = init, update = update, view = view }


page : String -> Element Msg
page searchField =
    column [ width fill ]
        [ myRowOfStuff searchField
        , renderSuggestionList (filterSortSuggestions 100 searchField suggestionList)
        ]


update : Msg -> Model -> Model
update msg model =
    case msg of
        SearchChanged text ->
            { model | searchField = text }

        SearchPressed ->
            model


view { searchField } =
    Element.layoutWith { options = [ Element.focusStyle noFocusStyle ] }
        []
        (page searchField)


type alias Model =
    { searchField : String
    }


init =
    { searchField = ""
    }


type Msg
    = SearchChanged String
    | SearchPressed


noFocusStyle : Element.FocusStyle
noFocusStyle =
    { borderColor = Nothing
    , backgroundColor = Nothing
    , shadow = Nothing
    }


searchBar : String -> Element Msg
searchBar searchField =
    row [ Background.color (rgb255 99 199 106) ]
        [ Input.text [ paddingXY 10 5, Border.width 0, Border.rounded 0 ]
            { onChange = SearchChanged
            , placeholder = Just (Input.placeholder [] (text "Search..."))
            , label = Input.labelHidden "Search field"
            , text = searchField
            }
        , Input.button [ paddingXY 10 5 ]
            { label = text "🔎"
            , onPress = Just SearchPressed
            }
        ]


myRowOfStuff : String -> Element Msg
myRowOfStuff searchField =
    row [ width fill, Element.alignTop, padding 10, spacing 30, Background.color (rgb255 191 100 114) ]
        [ myElement
        , myElement
        , el [ alignRight ] (searchBar searchField)
        ]


myElement : Element Msg
myElement =
    el
        [ Background.color (rgb255 240 0 245)
        , Font.color (rgb255 255 255 255)
        , Border.rounded 3
        , padding 10
        ]
        (text "stylish!")

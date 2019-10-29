module Main exposing (main, myElement, myRowOfStuff)

import Browser
import Data exposing (Suggestion, suggestionList)
import Element exposing (Element, alignRight, centerY, column, el, fill, height, padding, paddingXY, px, rgb255, row, spacing, text, width)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input exposing (button)
import Html exposing (Html)
import Search exposing (filterSortSuggestions)


main =
    Browser.sandbox { init = init, update = update, view = view }


page : Model -> Element Msg
page model =
    column [ width fill ]
        [ myRowOfStuff model.searchField
        , renderSuggestionList (filterSortSuggestions 100 model.searchField model.suggestionList)
        ]


update : Msg -> Model -> Model
update msg model =
    case msg of
        SearchChanged text ->
            { model | searchField = text }

        SearchPressed ->
            model

        UpvotePressed suggestion ->
            { model | suggestionList = List.append model.suggestionList [ suggestion ] }


view : Model -> Html.Html Msg
view model =
    Element.layoutWith { options = [ Element.focusStyle noFocusStyle ] }
        []
        (page model)


type alias Model =
    { searchField : String
    , suggestionList : List Data.Suggestion
    }


init : Model
init =
    { searchField = ""
    , suggestionList = suggestionList
    }


type Msg
    = SearchChanged String
    | SearchPressed
    | UpvotePressed Data.Suggestion


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


renderSuggestionList : List Suggestion -> Element Msg
renderSuggestionList suggestions =
    column [ width fill, padding 15, spacing 15 ]
        (List.map renderSuggestion suggestions)


renderSuggestion : Suggestion -> Element Msg
renderSuggestion suggestion =
    row [ width fill ]
        [ button []
            { onPress = Just (UpvotePressed suggestion)
            , label = text "Upvote"
            }
        , el [ Font.center, width (px 50) ] (suggestion.votes |> String.fromInt |> text)
        , column [ width fill ]
            [ el [ Font.size 28 ] (text suggestion.title)
            , el [ Font.size 20 ] (text suggestion.description)
            , el [ Font.alignRight, width fill ] (text suggestion.author)
            ]
        ]

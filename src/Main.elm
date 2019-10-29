module Main exposing (main, myElement, myRowOfStuff)

import Browser
import Browser.Navigation as Navigation exposing (Key)
import Data exposing (suggestionList)
import Element exposing (Element, alignRight, centerY, column, el, fill, height, padding, paddingXY, rgb255, row, spacing, text, width)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import Http
import Json.Decode as Json
import OAuth
import OAuth.Implicit
import SuggestionList exposing (renderSuggestionList)
import Url exposing (Url)


main : Program Flags Model Msg
main =
    Browser.application { init = init, onUrlChange = onUrlChange, onUrlRequest = onUrlRequest, subscriptions = subscriptions, update = update, view = view }


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


page : String -> Element Msg
page searchField =
    column [ width fill ]
        [ myRowOfStuff searchField
        , renderSuggestionList suggestionList
        ]


onUrlChange : Url -> Msg
onUrlChange _ =
    Noop


onUrlRequest : Browser.UrlRequest -> Msg
onUrlRequest _ =
    Noop


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SearchChanged text ->
            ( { model | searchField = text }, Cmd.none )

        SearchPressed ->
            ( model, Cmd.none )

        AuthButtonPressed ->
            ( model, Cmd.none )

        Noop ->
            ( model, Cmd.none )

        GotUserInfo _ ->
            ( model, Cmd.none )


view : Model -> Browser.Document Msg
view { searchField } =
    { body =
        [ Element.layoutWith { options = [ Element.focusStyle noFocusStyle ] }
            []
            (page searchField)
        ]
    , title = "My Idea Box"
    }


type alias AuthModel =
    { redirectUri : Url
    , error : Maybe String
    , token : Maybe OAuth.Token
    , state : String
    }


type alias Model =
    { searchField : String
    , auth : AuthModel
    }


type alias Flags =
    { randomBytes : String }


init :
    Flags
    -> Url
    -> Key
    -> ( Model, Cmd Msg )
init { randomBytes } url key =
    let
        authModel =
            { redirectUri = { url | query = Nothing, fragment = Nothing }
            , error = Nothing
            , token = Nothing
            , state = randomBytes
            }

        config : OAuthConfiguration
        config =
            {}

        ( auth, cmd ) =
            case OAuth.Implicit.parseToken url of
                OAuth.Implicit.Empty ->
                    ( authModel, Cmd.none )

                OAuth.Implicit.Success { token, state } ->
                    if state /= Just authModel.state then
                        ( { authModel | error = Just "'state' mismatch, request likely forged by an adversary!" }
                        , Cmd.none
                        )

                    else
                        ( { authModel | token = Just token }
                        , getUserInfo config token
                        )

                OAuth.Implicit.Error error ->
                    ( { authModel | error = Just <| errorResponseToString error }
                    , Cmd.none
                    )
    in
    ( { searchField = ""
      , auth = authModel
      }
    , cmd
    )


type alias Profile =
    { name : String
    , picture : String
    }


type alias OAuthConfiguration =
    { tokenEndpoint : Url
    , profileEndpoint : Url
    , clientId : String
    , secret : String
    , profileDecoder : Json.Decoder Profile
    }


getUserInfo : OAuthConfiguration -> OAuth.Token -> Cmd Msg
getUserInfo { profileEndpoint, profileDecoder } token =
    Http.request
        { method = "GET"
        , body = Http.emptyBody
        , headers = OAuth.useToken token []
        , tracker = Nothing
        , url = Url.toString profileEndpoint
        , expect = Http.expectJson GotUserInfo profileDecoder
        , timeout = Nothing
        }


type Msg
    = SearchChanged String
    | SearchPressed
    | AuthButtonPressed
    | Noop
    | GotUserInfo Profile



-- | SignInRequested { clientId : String, authorizationEndpoint : String }


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
        [ authButton
        , myElement
        , el [ alignRight ] (searchBar searchField)
        ]


authButton : Element Msg
authButton =
    Input.button []
        { label = text "login"
        , onPress = Just AuthButtonPressed
        }


myElement : Element Msg
myElement =
    el
        [ Background.color (rgb255 240 0 245)
        , Font.color (rgb255 255 255 255)
        , Border.rounded 3
        , padding 10
        ]
        (text "very stylish!")

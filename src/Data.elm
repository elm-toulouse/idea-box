module Data exposing (..)


type alias Suggestion =
    { title : String
    , description : String
    , author : String
    , votes : Int
    }


suggestionList : List Suggestion
suggestionList =
    [ { title = "Elm Idea Box"
      , description = "An application to allow Elm developers to vote on new suggestions."
      , author = "James E"
      , votes = 5
      }
    , { title = "Rendering Engine"
      , description = "A rendering engine identical to an existing Elm rendering engine."
      , author = "Matthieu P"
      , votes = 4
      }
    ]

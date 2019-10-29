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
    , { title = "Adding non plot objects to matplotlib plot"
      , description = "python matplotlib data-analysis"
      , author = "Moo10000"
      , votes = 0
      }
    , { title = "EaselJS - Change Transparency of a Line"
      , description = "javascript createjs easeljs"
      , author = "Eyesight Technology"
      , votes = 1
      }
    , { title = "Get unique values from a list in python"
      , description = "python"
      , author = "savitha"
      , votes = 689
      }
    , { title = "How to extract date time from an excel cell?"
      , description = "excel vba"
      , author = "Nikita Singh"
      , votes = 0
      }
    , { title = "fabricjs loadFromJSON subclass of Line"
      , description = "javascript json canvas fabricjs"
      , author = "rubengonzalez96"
      , votes = 0
      }
    , { title = "How I can extract year from a date in sql and use it in where clause"
      , description = "sql date hive where-clause"
      , author = "Sahar"
      , votes = 0
      }
    , { title = "Create multiple onFinalize triggers for the buckets in the same project"
      , description = "firebase google-cloud-functions"
      , author = "Dyan"
      , votes = 0
      }
    , { title = "Adding custom Authentication jar to kafka"
      , description = "authentication apache-kafka"
      , author = "tom dinh"
      , votes = 0
      }
    , { title = "Aligning image height along a row"
      , description = "html css flexbox object-fit"
      , author = "Dan"
      , votes = 3
      }
    , { title = "Add v-html to tag conditionally"
      , description = "vue.js vue-component"
      , author = "Brobic Vripiat"
      , votes = 0
      }
    , { title = "Detect URL in txt"
      , description = "javascript node.js"
      , author = "Ivan Erofeev"
      , votes = -1
      }
    , { title = "Connectivity issue with SQL Server database"
      , description = "sql-server database ms-access-2010"
      , author = "rman215"
      , votes = 0
      }
    , { title = "Where to get functional editor for simple code/config editing inside Windows Server Core docker container?"
      , description = "docker text-editor docker-for-windows"
      , author = "Ville Laitila"
      , votes = 0
      }
    , { title = "docker run -i --rm -p 8080:8080 default:latest fails for appsody quarkus stack"
      , description = "appsody"
      , author = "Py Thon"
      , votes = 0
      }
    , { title = "Model List property is NULL on Post in controller"
      , description = "c# asp.net-mvc"
      , author = "user3554331"
      , votes = 0
      }
    , { title = "How to sum up values of same field in array of objects?"
      , description = "javascript arrays"
      , author = "Leon Chung"
      , votes = 1
      }
    , { title = "Index a Pandas DataFrame/Series by Series of indices"
      , description = "python pandas"
      , author = "ska_james"
      , votes = 0
      }
    , { title = "Unable to write text to S3 bucket"
      , description = "node.js amazon-s3"
      , author = "Erik"
      , votes = 0
      }
    , { title = "How enumerate all classes with custom class attribute?"
      , description = "c# class attributes custom-attributes enumerate"
      , author = "tomash"
      , votes = 143
      }
    , { title = "How to split a field and put ; in it"
      , description = "linux vim"
      , author = "Jan De Wolf"
      , votes = -1
      }
    , { title = "Visual Studio Code PHP disable specific suggestions options"
      , description = "php laravel visual-studio-code"
      , author = "ProV"
      , votes = 0
      }
    , { title = "How do I capture both the backslash and the apostrophe in python"
      , description = "regex python-3.x escaping backslash apostrophe"
      , author = "JohnMilne"
      , votes = 0
      }
    , { title = "How to add child to children list conditionally?"
      , description = "flutter flutter-layout"
      , author = "user93796"
      , votes = 0
      }
    , { title = "How to check if the button has on-click listener"
      , description = "javascript jquery"
      , author = "chen"
      , votes = 0
      }
    , { title = "Reading data from a txt file, doing calculations and displaying the data in a certain format"
      , description = "java java.util.scanner"
      , author = "ConfusedAndLonely99"
      , votes = 0
      }
    , { title = "\"Another git process seems to be running in this repository, e.g. ...\""
      , description = "git"
      , author = "Versifiction"
      , votes = 0
      }
    , { title = "How can I read and write data from a custom stream with protocol buffers in c++?"
      , description = "c++ protocol-buffers"
      , author = "kbearski"
      , votes = 0
      }
    , { title = "Plugin with id 'com.google.gms.google-services' not found Open File"
      , description = "android firebase gradle build.gradle"
      , author = "Kamau Mbugua"
      , votes = 0
      }
    , { title = "How to group transactions by year and month?"
      , description = "python pandas"
      , author = "SCool"
      , votes = 0
      }
    , { title = "composing tasks with null checks within a method"
      , description = "java"
      , author = "nimo23"
      , votes = 1
      }
    ]

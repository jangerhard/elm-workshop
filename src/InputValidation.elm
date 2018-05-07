-- Read more about this program in the official Elm guide:
-- https://guide.elm-lang.org/architecture/user_input/buttons.html


module InputValidation exposing (..)

import Html exposing (Attribute, Html, beginnerProgram, button, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)


main =
    beginnerProgram { model = "0", view = view, update = update }



-- MODEL


type alias Model =
    String



-- UPDATE


type Msg
    = ValidateMe String


update : Msg -> Model -> Model
update msg model =
    case msg of
        ValidateMe newModel ->
            newModel



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ input [ placeholder "4", validate model, onInput ValidateMe ] []
        ]


oldEnough : Float -> Result String Bool
oldEnough age = if age >= 18 then Result.Ok True else Result.Err "Not 18"

validate : String -> Attribute msg
validate s =
    let
        res =
            String.toFloat s

        allGood = res |> Result.andThen oldEnough

        color =
            case allGood of
                Result.Ok _ ->
                    "black"

                _ ->
                    "red"
    in
        style (( "color", color ) :: styleList)


styleList : List ( String, String )
styleList =
    [ ( "width", "100%" )
    , ( "height", "40px" )
    , ( "padding", "10px 0" )
    , ( "font-size", "2em" )
    , ( "text-align", "center" )
    ]

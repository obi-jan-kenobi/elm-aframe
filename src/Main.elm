import Browser
import Html exposing (Html, button, div, text, node)
import Html.Events exposing (onClick)
import Html.Attributes exposing (property, attribute)
import Json.Encode as Encode

main = 
  Browser.sandbox { init = init, update = update, view = view }

type alias Model = Int

init : Model
init = 0

type Msg = Increment | Decrement

update : Msg -> Model -> Model
update msg model = model

position xyz = attribute "position" xyz
rotation xyz = attribute "rotation" xyz
color c = attribute "color" c
radius r = attribute "radius" r
height h = attribute "height" h
width w = attribute "width" w

scene attributes children = node "a-scene" [] children
box attributes children = node "a-box" attributes children
sphere attributes children = node "a-sphere" attributes children
plane attributes children = node "a-planet" attributes children
sky attributes children = node "a-sky" attributes children
cylinder attributes children = node "a-cylinder" attributes children

view model = div []
  [ button [ onClick Decrement ] [ text "hello"]
  , scene [] 
    [ box [position "-1 0.5 -3", rotation "0 45 0", color "#4CC3D9"] []
    , sphere [position "0 1.25 -5", radius "1.25", color "#EF2D5E"] []
    , cylinder [position "1 0.75 -3", radius "0.5", height "1.5", color "#FFC65D"] []
    , plane [position "0 0 -4", rotation "-90 0 0", width "4", height "4", color "#7BC8A4"] []
    , sky [color "#ECECEC"] []
    ]
  ]


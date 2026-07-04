data modify storage mm:main dialog.dialog set value {\
  "title": {\
    "translate": "mm.text_settings.map.weather",\
    "color": "yellow"\
  },\
  "type": "multi_action",\
  "columns": 1,\
  "body": [\
    {\
      "type": "plain_message",\
      "contents": {\
        "translate": "mm.text_settings.map.weather.description",\
        "color": "green"\
      }\
    },\
    {\
      "tag": "current_weather",\
      "type": "plain_message",\
      "contents": {\
        "translate": "mm.text_settings.map.weather.value",\
        "color": "green",\
        "with": [\
          {\
            "translate": "",\
            "color": "yellow"\
          }\
        ]\
      }\
    }\
  ],\
  "actions": [\
    {\
      "label": {\
        "translate": "mm.text_settings.map.weather.clear",\
        "color": "yellow"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:settings/map/weather/set {weather:1,weather_name:\"clear\"}"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_settings.map.weather.rain",\
        "color": "yellow"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:settings/map/weather/set {weather:2,weather_name:\"rain\"}"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_settings.map.weather.thunder",\
        "color": "yellow"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:settings/map/weather/set {weather:3,weather_name:\"thunder\"}"\
      }\
    }\
  ],\
  "exit_action": {\
    "label": {\
      "translate": "mm.text.back",\
      "color": "green"\
    },\
    "action": {\
      "type": "run_command",\
      "command": "/function mm:dialog/settings/map/main"\
    }\
  }\
}

execute store result storage mm:main temporary.index int 1 run scoreboard players get selected_map mm_main
data modify storage mm:main temporary.path set value "Weather"
execute store result score current_weather mm_main run function mm:utils/get_map_data with storage mm:main temporary

data modify storage mm:main temporary.path set value "temporary.translate_key"
data modify storage mm:main temporary.string_1 set value "mm.text_settings.map.weather."
execute if score current_weather mm_main matches 1 run data modify storage mm:main temporary.string_2 set value "clear"
execute if score current_weather mm_main matches 2 run data modify storage mm:main temporary.string_2 set value "rain"
execute if score current_weather mm_main matches 3 run data modify storage mm:main temporary.string_2 set value "thunder"
function mm:utils/concat_string_to_storage with storage mm:main temporary

data modify storage mm:main dialog.dialog.body[{tag:"current_weather"}].contents.with[0].translate set from storage mm:main temporary.translate_key

function mm:utils/show_dialog with storage mm:main dialog
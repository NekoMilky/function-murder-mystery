data modify storage mm:main dialog.dialog set value {\
  "title": {\
    "translate": "mm.text_settings.map.time",\
    "color": "yellow"\
  },\
  "type": "confirmation",\
  "columns": 1,\
  "inputs": [\
    {\
      "key": "set_time",\
      "type": "text",\
      "label": {\
        "translate": "mm.text_settings.map.time.input"\
      }\
    }\
  ],\
  "body": [\
    {\
      "type": "plain_message",\
      "contents": {\
        "translate": "mm.text_settings.map.time.description",\
        "color": "green"\
      }\
    },\
    {\
      "tag": "current_time",\
      "type": "plain_message",\
      "contents": {\
        "translate": "mm.text_settings.map.time.value",\
        "color": "green",\
        "with": [\
          {\
            "text": "0",\
            "color": "yellow"\
          }\
        ]\
      }\
    }\
  ],\
  "yes": {\
    "label": {\
      "translate": "mm.text.confirm",\
      "color": "aqua"\
    },\
    "action": {\
      "type": "dynamic/run_command",\
      "template": "/function mm:settings/map/time/set {time:\"$(missing)$(set_time)\"}"\
    }\
  },\
  "no": {\
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
data modify storage mm:main temporary.path set value "temporary.value"
data modify storage mm:main temporary.source_path set value "Time"
function mm:utils/get_map_data_to_storage with storage mm:main temporary

data modify storage mm:main temporary.type set value "storage"
data modify storage mm:main temporary.target set value "mm:main"
data modify storage mm:main temporary.path set value "dialog.dialog.body[{tag:\"current_time\"}].contents.with[0].text"
function mm:utils/set_string_data with storage mm:main temporary

function mm:utils/show_dialog with storage mm:main dialog
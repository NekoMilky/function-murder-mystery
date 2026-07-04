data modify storage mm:main dialog.dialog set value {\
  "title": {\
    "translate": "mm.text_settings.map.edit",\
    "color": "yellow"\
  },\
  "type": "multi_action",\
  "columns": 1,\
  "body": [\
    {\
      "type": "plain_message",\
      "contents": {\
        "translate": "mm.text_settings.map.edit.description",\
        "color": "green"\
      }\
    }\
  ],\
  "actions": [\
    {\
      "label": {\
        "translate": "mm.text_settings.map.edit.add",\
        "color": "yellow"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:dialog/settings/map/edit/add/main"\
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

data modify storage mm:main dialog.dialog.body append value {\
  "tag": "total_count",\
  "type": "plain_message",\
  "contents": {\
    "translate": "mm.text_settings.map.edit.value.total_count",\
    "color": "green",\
    "with": [\
      {\
        "text": "0",\
        "color": "yellow"\
      }\
    ]\
  }\
}
data modify storage mm:main temporary.type set value "storage"
data modify storage mm:main temporary.target set value "mm:main"
data modify storage mm:main temporary.path set value "dialog.dialog.body[{tag:\"total_count\"}].contents.with[0].text"
execute store result storage mm:main temporary.value int 1 run scoreboard players get map_count mm_main
function mm:utils/set_string_data with storage mm:main temporary

execute if score map_count mm_main matches 0 run data modify storage mm:main dialog.dialog.body append value {\
  "tag": "add",\
  "type": "plain_message",\
  "contents": {\
    "translate": "mm.text_settings.map.edit.value.add",\
    "color": "red"\
  }\
}
execute if score map_count mm_main matches 0 run function mm:utils/show_dialog with storage mm:main dialog
execute if score map_count mm_main matches 0 run return 0

data modify storage mm:main dialog.dialog.body append value {\
  "tag": "editing",\
  "type": "plain_message",\
  "contents": {\
    "translate": "mm.text_settings.map.edit.value.editing",\
    "color": "green",\
    "with": [\
      {\
        "text": "0",\
        "color": "yellow"\
      }\
    ]\
  }\
}
data modify storage mm:main dialog.dialog.actions append value {\
  "label": {\
    "translate": "mm.text_settings.map.edit.remove",\
    "color": "yellow"\
  },\
  "action": {\
    "type": "run_command",\
    "command": "/function mm:dialog/settings/map/edit/remove/main"\
  }\
}
data modify storage mm:main dialog.dialog.actions append value {\
  "label": {\
    "translate": "mm.text_settings.map.edit.select",\
    "color": "yellow"\
  },\
  "action": {\
    "type": "run_command",\
    "command": "/function mm:dialog/settings/map/edit/select/main"\
  }\
}

execute store result storage mm:main temporary.index int 1 run scoreboard players get selected_map mm_main
data modify storage mm:main temporary.path set value "dialog.dialog.body[{tag:\"editing\"}].contents.with[0].text"
data modify storage mm:main temporary.source_path set value "Name"
function mm:utils/get_map_data_to_storage with storage mm:main temporary

function mm:utils/show_dialog with storage mm:main dialog
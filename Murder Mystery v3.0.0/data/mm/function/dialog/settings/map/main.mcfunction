data modify storage mm:main dialog.dialog set value {\
  "title": {\
    "translate": "mm.text_settings.map",\
    "color": "yellow"\
  },\
  "type": "multi_action",\
  "columns": 1,\
  "body": [\
    {\
      "type": "plain_message",\
      "contents": {\
        "translate": "mm.text_settings.map.description",\
        "color": "green"\
      }\
    }\
  ],\
  "actions": [\
    {\
      "label": {\
        "translate": "mm.text_settings.map.edit",\
        "color": "yellow"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:dialog/settings/map/edit/main"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_settings.map.rename",\
        "color": "yellow"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:dialog/settings/map/rename/main"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_settings.map.time",\
        "color": "yellow"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:dialog/settings/map/time/main"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_settings.map.weather",\
        "color": "yellow"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:dialog/settings/map/weather/main"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_settings.map.spawn_waiting",\
        "color": "yellow"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:dialog/settings/map/spawn_waiting/main"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_settings.map.spawn_center",\
        "color": "yellow"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:dialog/settings/map/spawn_center/main"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_settings.map.spawn",\
        "color": "yellow"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:dialog/settings/map/spawn/main"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_settings.map.dangerous_block",\
        "color": "red"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:dialog/settings/map/dangerous_block/main"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_settings.map.map_features",\
        "color": "light_purple"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:dialog/settings/map/map_features/main"\
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
      "command": "/function mm:dialog/settings/main"\
    }\
  }\
}

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
execute store result storage mm:main temporary.index int 1 run scoreboard players get selected_map mm_main
data modify storage mm:main temporary.path set value "dialog.dialog.body[{tag:\"editing\"}].contents.with[0].text"
data modify storage mm:main temporary.source_path set value "Name"
function mm:utils/get_map_data_to_storage with storage mm:main temporary

function mm:utils/show_dialog with storage mm:main dialog

scoreboard players set @s mm_API_p 15
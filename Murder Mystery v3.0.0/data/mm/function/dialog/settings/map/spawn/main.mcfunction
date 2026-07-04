data modify storage mm:main dialog.dialog set value {\
  "title": {\
    "translate": "mm.text_settings.map.spawn",\
    "color": "yellow"\
  },\
  "type": "multi_action",\
  "columns": 1,\
  "body": [\
    {\
      "type": "plain_message",\
      "contents": {\
        "translate": "mm.text_settings.map.spawn.description",\
        "color": "green"\
      }\
    }\
  ],\
  "actions": [],\
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

data remove storage mm:main temporary.spawn
execute store result storage mm:main temporary.index int 1 run scoreboard players get selected_map mm_main
data modify storage mm:main temporary.path set value "temporary.spawn"
data modify storage mm:main temporary.source_path set value "Spawn"
function mm:utils/get_map_data_to_storage with storage mm:main temporary

execute unless data storage mm:main temporary.spawn run data modify storage mm:main dialog.dialog.body append value {\
  "tag": "add",\
  "type": "plain_message",\
  "contents": {\
    "translate": "mm.text_settings.map.spawn.value.add",\
    "color": "red"\
  }\
}
execute unless data storage mm:main temporary.spawn run data modify storage mm:main dialog.dialog.actions append value {\
  "label": {\
    "translate": "mm.text_settings.map.spawn.tool",\
    "color": "light_purple"\
  },\
  "action": {\
    "type": "run_command",\
    "command": "/function mm:settings/map/spawn/tool"\
  }\
}
execute unless data storage mm:main temporary.spawn run data modify storage mm:main dialog.dialog.actions append value {\
  "label": {\
    "translate": "mm.text_settings.map.spawn.register",\
    "color": "green"\
  },\
  "action": {\
    "type": "run_command",\
    "command": "/function mm:settings/map/spawn/register/main"\
  }\
}
execute unless data storage mm:main temporary.spawn run function mm:utils/show_dialog with storage mm:main dialog
execute unless data storage mm:main temporary.spawn run return 0

data modify storage mm:main dialog.dialog.body append value {\
  "tag": "spawn",\
  "type": "plain_message",\
  "contents": {\
    "translate": "mm.text_settings.map.spawn.value.current",\
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
    "translate": "mm.text_settings.map.spawn.unregister",\
    "color": "red"\
  },\
  "action": {\
    "type": "run_command",\
    "command": "/function mm:settings/map/spawn/unregister/main"\
  }\
}

execute store result storage mm:main temporary.value int 1 run function mm:utils/get_list_length_in_storage {path:"temporary.spawn",index:0}

data modify storage mm:main temporary.type set value "storage"
data modify storage mm:main temporary.target set value "mm:main"
data modify storage mm:main temporary.path set value "dialog.dialog.body[{tag:\"spawn\"}].contents.with[0].text"
function mm:utils/set_string_data with storage mm:main temporary

function mm:utils/show_dialog with storage mm:main dialog
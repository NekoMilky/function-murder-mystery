data modify storage mm:main dialog.dialog set value {\
  "title": {\
    "translate": "mm.text_settings.map.spawn_center",\
    "color": "yellow"\
  },\
  "type": "multi_action",\
  "columns": 1,\
  "body": [\
    {\
      "type": "plain_message",\
      "contents": {\
        "translate": "mm.text_settings.map.spawn_center.description",\
        "color": "green"\
      }\
    }\
  ],\
  "actions": [\
    {\
      "label": {\
        "translate": "mm.text_settings.map.spawn_center.set",\
        "color": "yellow"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:settings/map/spawn_center/set/main"\
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

data remove storage mm:main temporary.pos
execute store result storage mm:main temporary.index int 1 run scoreboard players get selected_map mm_main
data modify storage mm:main temporary.path set value "temporary.pos"
data modify storage mm:main temporary.source_path set value "SpawnCenter"
function mm:utils/get_map_data_to_storage with storage mm:main temporary

execute unless data storage mm:main temporary.pos run data modify storage mm:main dialog.dialog.body append value {\
  "tag": "add",\
  "type": "plain_message",\
  "contents": {\
    "translate": "mm.text_settings.map.spawn_center.value.add",\
    "color": "red"\
  }\
}
execute unless data storage mm:main temporary.pos run function mm:utils/show_dialog with storage mm:main dialog
execute unless data storage mm:main temporary.pos run return 0

data modify storage mm:main dialog.dialog.body append value {\
  "tag": "spawn_center",\
  "type": "plain_message",\
  "contents": {\
    "translate": "mm.text_settings.map.spawn_center.value.current",\
    "color": "green",\
    "with": [\
      {\
        "text": "0",\
        "color": "yellow"\
      },\
      {\
        "text": "0",\
        "color": "yellow"\
      },\
      {\
        "text": "0",\
        "color": "yellow"\
      },\
      {\
        "text": "0",\
        "color": "gold"\
      }\
    ]\
  }\
}
data modify storage mm:main dialog.dialog.actions append value {\
  "label": {\
    "translate": "mm.text_settings.map.spawn_center.teleport",\
    "color": "yellow"\
  },\
  "action": {\
    "type": "run_command",\
    "command": "/function mm:settings/map/spawn_center/teleport/main"\
  }\
}

data modify storage mm:main temporary.type set value "storage"
data modify storage mm:main temporary.target set value "mm:main"

data modify storage mm:main temporary.path set value "dialog.dialog.body[{tag:\"spawn_center\"}].contents.with[0].text"
data modify storage mm:main temporary.value set from storage mm:main temporary.pos[0] 
function mm:utils/set_string_data with storage mm:main temporary

data modify storage mm:main temporary.path set value "dialog.dialog.body[{tag:\"spawn_center\"}].contents.with[1].text"
data modify storage mm:main temporary.value set from storage mm:main temporary.pos[1] 
function mm:utils/set_string_data with storage mm:main temporary

data modify storage mm:main temporary.path set value "dialog.dialog.body[{tag:\"spawn_center\"}].contents.with[2].text"
data modify storage mm:main temporary.value set from storage mm:main temporary.pos[2] 
function mm:utils/set_string_data with storage mm:main temporary

data modify storage mm:main temporary.path set value "dialog.dialog.body[{tag:\"spawn_center\"}].contents.with[3].text"
data modify storage mm:main temporary.value set from storage mm:main temporary.pos[3] 
function mm:utils/set_string_data with storage mm:main temporary

function mm:utils/show_dialog with storage mm:main dialog
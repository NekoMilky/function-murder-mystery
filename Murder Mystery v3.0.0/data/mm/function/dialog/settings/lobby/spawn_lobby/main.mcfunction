data modify storage mm:main dialog.dialog set value {\
  "title": {\
    "translate": "mm.text_settings.lobby.spawn_lobby",\
    "color": "yellow"\
  },\
  "type": "multi_action",\
  "columns": 1,\
  "body": [\
    {\
      "type": "plain_message",\
      "contents": {\
        "translate": "mm.text_settings.lobby.spawn_lobby.description",\
        "color": "green"\
      }\
    }\
  ],\
  "actions": [\
    {\
      "label": {\
        "translate": "mm.text_settings.lobby.spawn_lobby.set",\
        "color": "yellow"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:settings/lobby/spawn_lobby/set/main"\
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
      "command": "/function mm:dialog/settings/lobby/main"\
    }\
  }\
}

execute unless data storage mm:main map.SpawnLobby run data modify storage mm:main dialog.dialog.body append value {\
  "tag": "add",\
  "type": "plain_message",\
  "contents": {\
    "translate": "mm.text_settings.lobby.spawn_lobby.value.add",\
    "color": "red"\
  }\
}
execute unless data storage mm:main map.SpawnLobby run function mm:utils/show_dialog with storage mm:main dialog
execute unless data storage mm:main map.SpawnLobby run return 0

data modify storage mm:main dialog.dialog.body append value {\
  "tag": "spawn_lobby",\
  "type": "plain_message",\
  "contents": {\
    "translate": "mm.text_settings.lobby.spawn_lobby.value.current",\
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
    "translate": "mm.text_settings.lobby.spawn_lobby.teleport",\
    "color": "yellow"\
  },\
  "action": {\
    "type": "run_command",\
    "command": "/function mm:settings/lobby/spawn_lobby/teleport"\
  }\
}

data modify storage mm:main temporary.type set value "storage"
data modify storage mm:main temporary.target set value "mm:main"

data modify storage mm:main temporary.path set value "dialog.dialog.body[{tag:\"spawn_lobby\"}].contents.with[0].text"
data modify storage mm:main temporary.value set from storage mm:main map.SpawnLobby[0] 
function mm:utils/set_string_data with storage mm:main temporary

data modify storage mm:main temporary.path set value "dialog.dialog.body[{tag:\"spawn_lobby\"}].contents.with[1].text"
data modify storage mm:main temporary.value set from storage mm:main map.SpawnLobby[1] 
function mm:utils/set_string_data with storage mm:main temporary

data modify storage mm:main temporary.path set value "dialog.dialog.body[{tag:\"spawn_lobby\"}].contents.with[2].text"
data modify storage mm:main temporary.value set from storage mm:main map.SpawnLobby[2] 
function mm:utils/set_string_data with storage mm:main temporary

data modify storage mm:main temporary.path set value "dialog.dialog.body[{tag:\"spawn_lobby\"}].contents.with[3].text"
data modify storage mm:main temporary.value set from storage mm:main map.SpawnLobby[3] 
function mm:utils/set_string_data with storage mm:main temporary

function mm:utils/show_dialog with storage mm:main dialog
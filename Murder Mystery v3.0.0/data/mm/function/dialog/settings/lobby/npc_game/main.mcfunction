data modify storage mm:main dialog.dialog set value {\
  "title": {\
    "translate": "mm.text_settings.lobby.npc_game",\
    "color": "yellow"\
  },\
  "type": "multi_action",\
  "columns": 1,\
  "body": [\
    {\
      "type": "plain_message",\
      "contents": {\
        "translate": "mm.text_settings.lobby.npc_game.description",\
        "color": "green"\
      }\
    }\
  ],\
  "actions": [\
    {\
      "label": {\
        "translate": "mm.text_settings.lobby.npc_game.create",\
        "color": "green"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:dialog/settings/lobby/npc_game/create"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_settings.lobby.npc_game.remove",\
        "color": "red"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:settings/lobby/npc_game/remove"\
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

function mm:utils/show_dialog with storage mm:main dialog
data modify storage mm:main dialog.dialog set value {\
  "title": {\
    "translate": "mm.text_settings.lobby.npc_game.create",\
    "color": "yellow"\
  },\
  "type": "confirmation",\
  "columns": 1,\
  "inputs": [\
    {\
      "key": "profile_name",\
      "type": "text",\
      "label": {\
        "translate": "mm.text_settings.lobby.npc_game.create.input"\
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
      "template": "/function mm:settings/lobby/npc_game/create {profile_name:$(missing)$(profile_name)}"\
    }\
  },\
  "no": {\
    "label": {\
      "translate": "mm.text.back",\
      "color": "green"\
    },\
    "action": {\
      "type": "run_command",\
      "command": "/function mm:dialog/settings/lobby/npc_game/main"\
    }\
  }\
}

function mm:utils/show_dialog with storage mm:main dialog
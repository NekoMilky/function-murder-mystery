data modify storage mm:main dialog.dialog set value {\
  "title": {\
    "translate": "mm.text_settings.lobby.leaderboard",\
    "color": "yellow"\
  },\
  "type": "multi_action",\
  "columns": 1,\
  "body": [\
    {\
      "type": "plain_message",\
      "contents": {\
        "translate": "mm.text_settings.lobby.leaderboard.description",\
        "color": "green"\
      }\
    }\
  ],\
  "actions": [\
    {\
      "label": {\
        "translate": "mm.text_settings.lobby.leaderboard.create",\
        "color": "green"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:settings/lobby/leaderboard/create"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_settings.lobby.leaderboard.remove",\
        "color": "red"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:settings/lobby/leaderboard/remove"\
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
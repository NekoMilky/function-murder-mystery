data modify storage mm:main dialog.dialog set value {\
  "title": {\
    "translate": "mm.text_settings.lobby.server_id",\
    "color": "yellow"\
  },\
  "type": "confirmation",\
  "columns": 1,\
  "inputs": [\
    {\
      "key": "id",\
      "type": "text",\
      "label": {\
        "translate": "mm.text_settings.lobby.server_id.set.input"\
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
      "template": "/function mm:settings/lobby/server_id/set {id:$(missing)$(id)}"\
    }\
  },\
  "no": {\
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
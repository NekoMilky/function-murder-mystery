data modify storage mm:main dialog.dialog set value {\
  "title": {\
    "translate": "mm.text_stats.others",\
    "color": "yellow"\
  },\
  "type": "confirmation",\
  "columns": 1,\
  "inputs": [\
    {\
      "key": "player_name",\
      "type": "text",\
      "label": {\
        "translate": "mm.text_stats.others.input"\
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
      "template": "/function mm:stats/check {player_name:\"$(missing)$(player_name)\"}"\
    }\
  },\
  "no": {\
    "label": {\
      "translate": "mm.text.back",\
      "color": "green"\
    },\
    "action": {\
      "type": "run_command",\
      "command": "/function mm:dialog/stats/main"\
    }\
  }\
}

function mm:utils/show_dialog with storage mm:main dialog
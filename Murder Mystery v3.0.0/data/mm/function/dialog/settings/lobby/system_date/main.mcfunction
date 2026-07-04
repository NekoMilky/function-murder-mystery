data modify storage mm:main dialog.dialog set value {\
  "title": {\
    "translate": "mm.text_settings.lobby.system_date",\
    "color": "yellow"\
  },\
  "type": "confirmation",\
  "columns": 1,\
  "inputs": [\
    {\
      "key": "year",\
      "type": "text",\
      "label": {\
        "translate": "mm.text_settings.lobby.system_date.set.input.year"\
      }\
    },\
    {\
      "key": "month",\
      "type": "text",\
      "label": {\
        "translate": "mm.text_settings.lobby.system_date.set.input.month"\
      }\
    },\
    {\
      "key": "day",\
      "type": "text",\
      "label": {\
        "translate": "mm.text_settings.lobby.system_date.set.input.day"\
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
      "template": "/function mm:settings/lobby/system_date/set {year:$(missing)$(year),month:$(missing)$(month),day:$(missing)$(day)}"\
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
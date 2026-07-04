data modify storage mm:main dialog.dialog set value {\
  "title": {\
    "translate": "mm.text_settings.map.edit.add",\
    "color": "yellow"\
  },\
  "type": "confirmation",\
  "columns": 1,\
  "inputs": [\
    {\
      "key": "map_name",\
      "type": "text",\
      "label": {\
        "translate": "mm.text_settings.map.edit.add.input"\
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
      "template": "/function mm:settings/map/edit/add {map_name:\"$(missing)$(map_name)\"}"\
    }\
  },\
  "no": {\
    "label": {\
      "translate": "mm.text.back",\
      "color": "green"\
    },\
    "action": {\
      "type": "run_command",\
      "command": "/function mm:dialog/settings/map/edit/main"\
    }\
  }\
}

function mm:utils/show_dialog with storage mm:main dialog
$data modify storage mm:main dialog.dialog set value {\
  "title": {\
    "translate": "mm.text_settings.map.edit.remove.confirm",\
    "color": "yellow"\
  },\
  "type": "confirmation",\
  "columns": 1,\
  "body": [\
    {\
      "type": "plain_message",\
      "contents": {\
        "translate": "mm.text_settings.map.edit.remove.confirm.description",\
        "color": "red",\
        "with": [\
          {\
            "text": "$(map_name)"\
          }\
        ]\
      }\
    }\
  ],\
  "yes": {\
    "label": {\
      "translate": "mm.text.confirm",\
      "color": "red"\
    },\
    "action": {\
      "type": "run_command",\
      "command": "/function mm:settings/map/edit/remove {map_name:\"$(map_name)\"}"\
    }\
  },\
  "no": {\
    "label": {\
      "translate": "mm.text.back",\
      "color": "green"\
    },\
    "action": {\
      "type": "run_command",\
      "command": "/function mm:dialog/settings/map/edit/remove/main"\
    }\
  }\
}

function mm:utils/show_dialog with storage mm:main dialog
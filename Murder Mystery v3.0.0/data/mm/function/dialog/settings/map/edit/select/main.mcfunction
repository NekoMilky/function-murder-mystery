data modify storage mm:main dialog.dialog set value {\
  "title": {\
    "translate": "mm.text_settings.map.edit.select",\
    "color": "yellow"\
  },\
  "type": "multi_action",\
  "columns": 1,\
  "body": [\
    {\
      "type": "plain_message",\
      "contents": {\
        "translate": "mm.text_settings.map.edit.select.description",\
        "color": "green"\
      }\
    }\
  ],\
  "actions": [],\
  "exit_action": {\
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

function mm:dialog/settings/map/edit/add_maps_to_dialog {index:0,callback:"mm:settings/map/edit/select"}
function mm:utils/show_dialog with storage mm:main dialog
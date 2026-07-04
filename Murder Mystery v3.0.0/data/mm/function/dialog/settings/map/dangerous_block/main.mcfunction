data modify storage mm:main dialog.dialog set value {\
  "title": {\
    "translate": "mm.text_settings.map.dangerous_block",\
    "color": "yellow"\
  },\
  "type": "multi_action",\
  "columns": 1,\
  "body": [\
    {\
      "type": "plain_message",\
      "contents": {\
        "translate": "mm.text_settings.map.dangerous_block.description",\
        "color": "green"\
      }\
    }\
  ],\
  "actions": [\
    {\
      "label": {\
        "translate": "mm.text_settings.map.dangerous_block.lava",\
        "color": "yellow"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:dialog/settings/map/dangerous_block/entry/main {danger:\"Lava\",danger_type:\"lava\",allowed_drown:0,allowed_slow:1}"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_settings.map.dangerous_block.water",\
        "color": "yellow"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:dialog/settings/map/dangerous_block/entry/main {danger:\"Water\",danger_type:\"water\",allowed_drown:1,allowed_slow:1}"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_settings.map.dangerous_block.fire",\
        "color": "yellow"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:dialog/settings/map/dangerous_block/entry/main {danger:\"Fire\",danger_type:\"fire\",allowed_drown:0,allowed_slow:1}"\
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
      "command": "/function mm:dialog/settings/map/main"\
    }\
  }\
}

function mm:utils/show_dialog with storage mm:main dialog

scoreboard players set @s mm_API_p 16
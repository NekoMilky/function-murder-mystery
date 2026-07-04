data modify storage mm:main dialog.dialog set value {\
  "title": {\
    "translate": "mm.text_settings.play.dangerous_block_health",\
    "color": "yellow"\
  },\
  "type": "multi_action",\
  "columns": 1,\
  "body": [\
    {\
      "type": "plain_message",\
      "contents": {\
        "translate": "mm.text_settings.play.dangerous_block_health.description",\
        "color": "green"\
      }\
    }\
  ],\
  "actions": [\
    {\
      "label": {\
        "translate": "mm.text_settings.play.dangerous_block_health.lava",\
        "color": "yellow"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:dialog/settings/play/integer_entry/main {name:\"dangerous_block_health.lava\",scoreboard_name:\"lava_health\",back_path:\"dangerous_block_health/main\",min:0,max:99999}"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_settings.play.dangerous_block_health.water",\
        "color": "yellow"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:dialog/settings/play/integer_entry/main {name:\"dangerous_block_health.water\",scoreboard_name:\"water_health\",back_path:\"dangerous_block_health/main\",min:0,max:99999}"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_settings.play.dangerous_block_health.fire",\
        "color": "yellow"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:dialog/settings/play/integer_entry/main {name:\"dangerous_block_health.fire\",scoreboard_name:\"fire_health\",back_path:\"dangerous_block_health/main\",min:0,max:99999}"\
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
      "command": "/function mm:dialog/settings/play/main"\
    }\
  }\
}

function mm:utils/show_dialog with storage mm:main dialog

scoreboard players set @s mm_API_p 26
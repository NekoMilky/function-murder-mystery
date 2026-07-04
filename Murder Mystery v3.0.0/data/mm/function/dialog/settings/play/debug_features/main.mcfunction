data modify storage mm:main dialog.dialog set value {\
  "title": {\
    "translate": "mm.text_settings.play.debug_features",\
    "color": "yellow"\
  },\
  "type": "multi_action",\
  "columns": 1,\
  "body": [\
    {\
      "type": "plain_message",\
      "contents": {\
        "translate": "mm.text_settings.play.debug_features.description",\
        "color": "green"\
      }\
    }\
  ],\
  "actions": [\
    {\
      "label": {\
        "translate": "mm.text_settings.play.debug_features.clear_dead_body",\
        "color": "yellow"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:dialog/settings/play/bool_entry/main {name:\"debug_features.clear_dead_body\",scoreboard_name:\"dead_body_clear\",back_path:\"debug_features/main\"}"\
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

scoreboard players set @s mm_API_p 28
data modify storage mm:main dialog.dialog set value {\
  "title": {\
    "translate": "mm.text_settings.play",\
    "color": "yellow"\
  },\
  "type": "multi_action",\
  "columns": 1,\
  "body": [\
    {\
      "type": "plain_message",\
      "contents": {\
        "translate": "mm.text_settings.play.description",\
        "color": "green"\
      }\
    }\
  ],\
  "actions": [\
    {\
      "label": {\
        "translate": "mm.text_settings.play.waiting_duration",\
        "color": "yellow"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:dialog/settings/play/integer_entry/main {name:\"waiting_duration\",scoreboard_name:\"game_start_wait_time\",back_path:\"main\",min:10,max:60}"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_settings.play.game_duration",\
        "color": "yellow"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:dialog/settings/play/integer_entry/main {name:\"game_duration\",scoreboard_name:\"game_time\",back_path:\"main\",min:60,max:3600}"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_settings.play.gold_generate_rate",\
        "color": "yellow"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:dialog/settings/play/integer_entry/main {name:\"gold_generate_rate\",scoreboard_name:\"spawn_gold_ingot_rate\",back_path:\"main\",min:1,max:64}"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_settings.play.mode_features",\
        "color": "light_purple"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:dialog/settings/play/mode_features/main"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_settings.play.dangerous_block_health",\
        "color": "red"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:dialog/settings/play/dangerous_block_health/main"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_settings.play.debug_features",\
        "color": "aqua"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:dialog/settings/play/debug_features/main"\
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
      "command": "/function mm:dialog/settings/main"\
    }\
  }\
}

function mm:utils/show_dialog with storage mm:main dialog

scoreboard players set @s mm_API_p 24
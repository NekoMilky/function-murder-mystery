data modify storage mm:main dialog.dialog set value {\
  "title": {\
    "translate": "mm.text_settings.play.mode_features.prop_enable",\
    "color": "yellow"\
  },\
  "type": "multi_action",\
  "columns": 1,\
  "body": [\
    {\
      "type": "plain_message",\
      "contents": {\
        "translate": "mm.text_settings.play.mode_features.prop_enable.description",\
        "color": "green"\
      }\
    }\
  ],\
  "actions": [\
    {\
      "label": {\
        "translate": "mm.text_settings.play.mode_features.prop_enable.1",\
        "color": "green"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:dialog/settings/play/bool_entry/main {name:\"mode_features.prop_enable.1\",scoreboard_name:\"prop_1_enable\",back_path:\"mode_features/prop_enable/main\"}"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_settings.play.mode_features.prop_enable.2",\
        "color": "green"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:dialog/settings/play/bool_entry/main {name:\"mode_features.prop_enable.2\",scoreboard_name:\"prop_2_enable\",back_path:\"mode_features/prop_enable/main\"}"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_settings.play.mode_features.prop_enable.3",\
        "color": "blue"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:dialog/settings/play/bool_entry/main {name:\"mode_features.prop_enable.3\",scoreboard_name:\"prop_3_enable\",back_path:\"mode_features/prop_enable/main\"}"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_settings.play.mode_features.prop_enable.4",\
        "color": "blue"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:dialog/settings/play/bool_entry/main {name:\"mode_features.prop_enable.4\",scoreboard_name:\"prop_4_enable\",back_path:\"mode_features/prop_enable/main\"}"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_settings.play.mode_features.prop_enable.5",\
        "color": "blue"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:dialog/settings/play/bool_entry/main {name:\"mode_features.prop_enable.5\",scoreboard_name:\"prop_5_enable\",back_path:\"mode_features/prop_enable/main\"}"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_settings.play.mode_features.prop_enable.6",\
        "color": "blue"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:dialog/settings/play/bool_entry/main {name:\"mode_features.prop_enable.6\",scoreboard_name:\"prop_6_enable\",back_path:\"mode_features/prop_enable/main\"}"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_settings.play.mode_features.prop_enable.7",\
        "color": "dark_purple"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:dialog/settings/play/bool_entry/main {name:\"mode_features.prop_enable.7\",scoreboard_name:\"prop_7_enable\",back_path:\"mode_features/prop_enable/main\"}"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_settings.play.mode_features.prop_enable.8",\
        "color": "dark_purple"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:dialog/settings/play/bool_entry/main {name:\"mode_features.prop_enable.8\",scoreboard_name:\"prop_8_enable\",back_path:\"mode_features/prop_enable/main\"}"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_settings.play.mode_features.prop_enable.9",\
        "color": "dark_purple"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:dialog/settings/play/bool_entry/main {name:\"mode_features.prop_enable.9\",scoreboard_name:\"prop_9_enable\",back_path:\"mode_features/prop_enable/main\"}"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_settings.play.mode_features.prop_enable.10",\
        "color": "dark_purple"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:dialog/settings/play/bool_entry/main {name:\"mode_features.prop_enable.10\",scoreboard_name:\"prop_10_enable\",back_path:\"mode_features/prop_enable/main\"}"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_settings.play.mode_features.prop_enable.11",\
        "color": "gold"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:dialog/settings/play/bool_entry/main {name:\"mode_features.prop_enable.11\",scoreboard_name:\"prop_11_enable\",back_path:\"mode_features/prop_enable/main\"}"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_settings.play.mode_features.prop_enable.12",\
        "color": "gold"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:dialog/settings/play/bool_entry/main {name:\"mode_features.prop_enable.12\",scoreboard_name:\"prop_12_enable\",back_path:\"mode_features/prop_enable/main\"}"\
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
      "command": "/function mm:dialog/settings/play/mode_features/main"\
    }\
  }\
}

function mm:utils/show_dialog with storage mm:main dialog

scoreboard players set @s mm_API_p 27
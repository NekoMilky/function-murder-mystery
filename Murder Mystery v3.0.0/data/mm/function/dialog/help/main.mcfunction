data modify storage mm:main dialog.dialog set value {\
  "title": {\
    "translate": "mm.text_help.help",\
    "color": "yellow"\
  },\
  "type": "multi_action",\
  "columns": 1,\
  "body": [\
    {\
      "type": "plain_message",\
      "contents": {\
        "translate": "mm.text_help.help.description",\
        "color": "green"\
      }\
    }\
  ],\
  "actions": [\
    {\
      "label": {\
        "translate": "mm.text_cosmetics.cosmetics",\
        "color": "light_purple"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/trigger mm_cosmetics"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_stats.stats",\
        "color": "blue"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/trigger mm_stats"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_help.spectator",\
        "color": "dark_purple"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/trigger mm_spectator"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_game_mode.game_mode",\
        "color": "yellow"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/trigger mm_game_mode"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_settings.settings",\
        "color": "green"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:settings"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_help.pause",\
        "color": "red"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:pause"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_help.uninstall",\
        "color": "gold"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:uni"\
      }\
    }\
  ],\
  "exit_action": {\
    "label": {\
      "translate": "mm.text.close",\
      "color": "red"\
    }\
  }\
}

function mm:utils/show_dialog with storage mm:main dialog

scoreboard players set @s mm_API_p 12
data modify storage mm:main dialog.dialog set value {\
  "title": {\
    "translate": "mm.text_cosmetics.cosmetics",\
    "color": "yellow"\
  },\
  "type": "multi_action",\
  "columns": 1,\
  "body": [\
    {\
      "type": "plain_message",\
      "contents": {\
        "translate": "mm.text_cosmetics.cosmetics.description",\
        "color": "green"\
      }\
    }\
  ],\
  "actions": [\
    {\
      "label": {\
        "translate": "mm.text_cosmetics.knife_skin",\
        "color": "yellow"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/trigger mm_cosmetics set 11"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_cosmetics.projectile",\
        "color": "yellow"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/trigger mm_cosmetics set 12"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_cosmetics.lastwords",\
        "color": "yellow"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/trigger mm_cosmetics set 13"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_cosmetics.death_cry",\
        "color": "yellow"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/trigger mm_cosmetics set 14"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_cosmetics.head",\
        "color": "yellow"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/trigger mm_cosmetics set 15"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_cosmetics.kill_effect",\
        "color": "yellow"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/trigger mm_cosmetics set 16"\
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
      "command": "/trigger mm_help"\
    }\
  }\
}

function mm:utils/show_dialog with storage mm:main dialog

scoreboard players set @s mm_API_p 1
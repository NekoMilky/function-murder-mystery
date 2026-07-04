data modify storage mm:main dialog.dialog set value {\
  "title": {\
    "translate": "mm.text_stats.stats",\
    "color": "yellow"\
  },\
  "type": "multi_action",\
  "columns": 1,\
  "body": [\
    {\
      "type": "plain_message",\
      "contents": {\
        "translate": "mm.text_stats.stats.description",\
        "color": "green"\
      }\
    }\
  ],\
  "actions": [\
    {\
      "label": {\
        "translate": "mm.text_stats.self",\
        "color": "yellow"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/trigger mm_stats set 2"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_stats.others",\
        "color": "yellow"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/trigger mm_stats set 3"\
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

scoreboard players set @s mm_API_p 9
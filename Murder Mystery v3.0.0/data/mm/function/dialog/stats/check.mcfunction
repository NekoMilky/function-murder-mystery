$data modify storage mm:main dialog.dialog set value {\
  "title": {\
    "translate": "mm.text_stats.stats",\
    "color": "yellow"\
  },\
  "type": "notice",\
  "columns": 1,\
  "body": [\
    {\
      "type": "plain_message",\
      "contents": {\
        "translate": "mm.text_stats.others.value",\
        "color": "green",\
        "with": [\
          {\
            "text": "$(player_name)",\
            "color": "yellow"\
          }\
        ]\
      }\
    }\
  ],\
  "action": {\
    "label": {\
      "translate": "mm.text.back",\
      "color": "green"\
    },\
    "action": {\
      "type": "run_command",\
      "command": "/trigger mm_stats"\
    }\
  }\
}

$function mm:dialog/stats/add {index:1,player_name:$(player_name)}

function mm:utils/show_dialog with storage mm:main dialog

scoreboard players set @s mm_API_p 10
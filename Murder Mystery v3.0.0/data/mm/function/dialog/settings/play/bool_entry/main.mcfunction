$data modify storage mm:main dialog.dialog set value {\
  "title": {\
    "translate": "mm.text_settings.play.$(name)",\
    "color": "yellow"\
  },\
  "type": "multi_action",\
  "columns": 1,\
  "body": [\
    {\
      "type": "plain_message",\
      "contents": {\
        "translate": "mm.text_settings.play.$(name).description",\
        "color": "green"\
      }\
    },\
    {\
      "tag": "current_value",\
      "type": "plain_message",\
      "contents": {\
        "translate": "mm.text.current_value",\
        "color": "green",\
        "with": [\
          {\
            "translate": "mm.text_settings.play.$(name)"\
          },\
          {\
            "translate": "",\
            "color": ""\
          }\
        ]\
      }\
    }\
  ],\
  "actions": [\
    {\
      "label": {\
        "translate": "mm.text.enable",\
        "color": "green"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:settings/play/bool_common/set {name:$(name),scoreboard_name:$(scoreboard_name),value:1}"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text.disable",\
        "color": "red"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:settings/play/bool_common/set {name:$(name),scoreboard_name:$(scoreboard_name),value:0}"\
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
      "command": "/function mm:dialog/settings/play/$(back_path)"\
    }\
  }\
}

$execute if score $(scoreboard_name) mm_settings matches 1 run data modify storage mm:main dialog.dialog.body[{tag:"current_value"}].contents.with[1].translate set value "mm.text.enable"
$execute if score $(scoreboard_name) mm_settings matches 1 run data modify storage mm:main dialog.dialog.body[{tag:"current_value"}].contents.with[1].color set value "green"
$execute if score $(scoreboard_name) mm_settings matches 0 run data modify storage mm:main dialog.dialog.body[{tag:"current_value"}].contents.with[1].translate set value "mm.text.disable"
$execute if score $(scoreboard_name) mm_settings matches 0 run data modify storage mm:main dialog.dialog.body[{tag:"current_value"}].contents.with[1].color set value "red"

function mm:utils/show_dialog with storage mm:main dialog
data modify storage mm:main dialog.dialog set value {\
  "title": {\
    "translate": "mm.text_settings.play.mode_features.murderer_friendly_fire",\
    "color": "yellow"\
  },\
  "type": "multi_action",\
  "columns": 1,\
  "body": [\
    {\
      "type": "plain_message",\
      "contents": {\
        "translate": "mm.text_settings.play.mode_features.murderer_friendly_fire.description",\
        "color": "green"\
      }\
    },\
    {\
      "tag": "current_murderer_friendly_fire",\
      "type": "plain_message",\
      "contents": {\
        "translate": "mm.text.current_value",\
        "color": "green",\
        "with": [\
          {\
            "translate": "mm.text_settings.play.mode_features.murderer_friendly_fire"\
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
        "command": "/function mm:settings/play/mode_features/murderer_friendly_fire/true"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text.disable",\
        "color": "red"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:settings/play/mode_features/murderer_friendly_fire/false"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_settings.play.mode_features.murderer_friendly_fire.stun",\
        "color": "gold"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:settings/play/mode_features/murderer_friendly_fire/stun"\
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

execute if score murderer_friendly_fire mm_settings matches 2 run data modify storage mm:main dialog.dialog.body[{tag:"current_murderer_friendly_fire"}].contents.with[1].translate set value "mm.text_settings.play.mode_features.murderer_friendly_fire.stun"
execute if score murderer_friendly_fire mm_settings matches 2 run data modify storage mm:main dialog.dialog.body[{tag:"current_murderer_friendly_fire"}].contents.with[1].color set value "gold"
execute if score murderer_friendly_fire mm_settings matches 1 run data modify storage mm:main dialog.dialog.body[{tag:"current_murderer_friendly_fire"}].contents.with[1].translate set value "mm.text.enable"
execute if score murderer_friendly_fire mm_settings matches 1 run data modify storage mm:main dialog.dialog.body[{tag:"current_murderer_friendly_fire"}].contents.with[1].color set value "green"
execute if score murderer_friendly_fire mm_settings matches 0 run data modify storage mm:main dialog.dialog.body[{tag:"current_murderer_friendly_fire"}].contents.with[1].translate set value "mm.text.disable"
execute if score murderer_friendly_fire mm_settings matches 0 run data modify storage mm:main dialog.dialog.body[{tag:"current_murderer_friendly_fire"}].contents.with[1].color set value "red"

function mm:utils/show_dialog with storage mm:main dialog
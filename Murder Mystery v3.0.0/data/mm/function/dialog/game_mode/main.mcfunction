data modify storage mm:main dialog.dialog set value {\
  "title": {\
    "translate": "mm.text_game_mode.game_mode",\
    "color": "yellow"\
  },\
  "type": "multi_action",\
  "columns": 1,\
  "body": [\
    {\
      "type": "plain_message",\
      "contents": {\
        "translate": "mm.text_game_mode.description",\
        "color": "green"\
      }\
    },\
    {\
      "tag": "current_game_mode",\
      "type": "plain_message",\
      "contents": {\
        "translate": "mm.text_game_mode.value",\
        "color": "green",\
        "with": [\
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
        "translate": "mm.text_game_mode.classic",\
        "color": "green"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/trigger mm_game_mode set 10"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_game_mode.double_up",\
        "color": "green"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/trigger mm_game_mode set 11"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_game_mode.infection_v1",\
        "color": "green"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/trigger mm_game_mode set 12"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_game_mode.showdown",\
        "color": "green"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/trigger mm_game_mode set 13"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_game_mode.human_robot_war",\
        "color": "gold"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/trigger mm_game_mode set 14"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_game_mode.prop",\
        "color": "light_purple"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/trigger mm_game_mode set 15"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_game_mode.survival",\
        "color": "light_purple"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/trigger mm_game_mode set 16"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_game_mode.infection_v2",\
        "color": "green"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/trigger mm_game_mode set 17"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_game_mode.prop_double_up",\
        "color": "light_purple"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/trigger mm_game_mode set 18"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_game_mode.boss",\
        "color": "gold"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/trigger mm_game_mode set 19"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_game_mode.showdown_armed",\
        "color": "light_purple"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/trigger mm_game_mode set 20"\
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
      "command": "/function mm:dialog/help/main"\
    }\
  }\
}

execute if score game_mode mm_main matches 0 run data modify storage mm:main dialog.dialog.body[{tag:"current_game_mode"}].contents.with[0].translate set value "mm.text_game_mode.classic"
execute if score game_mode mm_main matches 1 run data modify storage mm:main dialog.dialog.body[{tag:"current_game_mode"}].contents.with[0].translate set value "mm.text_game_mode.double_up"
execute if score game_mode mm_main matches 2 run data modify storage mm:main dialog.dialog.body[{tag:"current_game_mode"}].contents.with[0].translate set value "mm.text_game_mode.infection_v1"
execute if score game_mode mm_main matches 3 run data modify storage mm:main dialog.dialog.body[{tag:"current_game_mode"}].contents.with[0].translate set value "mm.text_game_mode.showdown"
execute if score game_mode mm_main matches 4 run data modify storage mm:main dialog.dialog.body[{tag:"current_game_mode"}].contents.with[0].translate set value "mm.text_game_mode.human_robot_war"
execute if score game_mode mm_main matches 5 run data modify storage mm:main dialog.dialog.body[{tag:"current_game_mode"}].contents.with[0].translate set value "mm.text_game_mode.prop"
execute if score game_mode mm_main matches 6 run data modify storage mm:main dialog.dialog.body[{tag:"current_game_mode"}].contents.with[0].translate set value "mm.text_game_mode.survival"
execute if score game_mode mm_main matches 7 run data modify storage mm:main dialog.dialog.body[{tag:"current_game_mode"}].contents.with[0].translate set value "mm.text_game_mode.infection_v2"
execute if score game_mode mm_main matches 8 run data modify storage mm:main dialog.dialog.body[{tag:"current_game_mode"}].contents.with[0].translate set value "mm.text_game_mode.prop_double_up"
execute if score game_mode mm_main matches 9 run data modify storage mm:main dialog.dialog.body[{tag:"current_game_mode"}].contents.with[0].translate set value "mm.text_game_mode.boss"
execute if score game_mode mm_main matches 10 run data modify storage mm:main dialog.dialog.body[{tag:"current_game_mode"}].contents.with[0].translate set value "mm.text_game_mode.showdown_armed"

execute if score game_mode mm_main matches 0..3 run data modify storage mm:main dialog.dialog.body[{tag:"current_game_mode"}].contents.with[0].color set value "green"
execute if score game_mode mm_main matches 4 run data modify storage mm:main dialog.dialog.body[{tag:"current_game_mode"}].contents.with[0].color set value "gold"
execute if score game_mode mm_main matches 5..6 run data modify storage mm:main dialog.dialog.body[{tag:"current_game_mode"}].contents.with[0].color set value "light_purple"
execute if score game_mode mm_main matches 7 run data modify storage mm:main dialog.dialog.body[{tag:"current_game_mode"}].contents.with[0].color set value "green"
execute if score game_mode mm_main matches 8 run data modify storage mm:main dialog.dialog.body[{tag:"current_game_mode"}].contents.with[0].color set value "light_purple"
execute if score game_mode mm_main matches 9 run data modify storage mm:main dialog.dialog.body[{tag:"current_game_mode"}].contents.with[0].color set value "gold"
execute if score game_mode mm_main matches 10 run data modify storage mm:main dialog.dialog.body[{tag:"current_game_mode"}].contents.with[0].color set value "light_purple"

function mm:utils/show_dialog with storage mm:main dialog
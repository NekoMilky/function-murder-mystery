data modify storage mm:main dialog.dialog set value {\
  "title": {\
    "translate": "mm.text_settings.play.mode_features",\
    "color": "yellow"\
  },\
  "type": "multi_action",\
  "columns": 1,\
  "body": [\
    {\
      "type": "plain_message",\
      "contents": {\
        "translate": "mm.text_settings.play.mode_features.description",\
        "color": "green"\
      }\
    }\
  ],\
  "actions": [\
    {\
      "label": {\
        "translate": "mm.text_settings.play.mode_features.murderer_charging_cooldown",\
        "color": "yellow"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:dialog/settings/play/integer_entry/main {name:\"mode_features.murderer_charging_cooldown\",scoreboard_name:\"cooldown_normal\",back_path:\"mode_features/main\",min:0,max:99999}"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_settings.play.mode_features.murderer_throwing_duration",\
        "color": "yellow"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:dialog/settings/play/integer_entry/main {name:\"mode_features.murderer_throwing_duration\",scoreboard_name:\"cooldown_throw\",back_path:\"mode_features/main\",min:0,max:99999}"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_settings.play.mode_features.detective_charging_cooldown",\
        "color": "yellow"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:dialog/settings/play/integer_entry/main {name:\"mode_features.detective_charging_cooldown\",scoreboard_name:\"cooldown_det\",back_path:\"mode_features/main\",min:0,max:99999}"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_settings.play.mode_features.infected_charging_cooldown",\
        "color": "yellow"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:dialog/settings/play/integer_entry/main {name:\"mode_features.infected_charging_cooldown\",scoreboard_name:\"infection_cooldown_normal\",back_path:\"mode_features/main\",min:0,max:99999}"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_settings.play.mode_features.infected_throwing_duration",\
        "color": "yellow"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:dialog/settings/play/integer_entry/main {name:\"mode_features.infected_throwing_duration\",scoreboard_name:\"infection_cooldown_throw\",back_path:\"mode_features/main\",min:0,max:99999}"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_settings.play.mode_features.shoot_charging_cooldown",\
        "color": "yellow"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:dialog/settings/play/integer_entry/main {name:\"mode_features.shoot_charging_cooldown\",scoreboard_name:\"shoot_cooldown_normal\",back_path:\"mode_features/main\",min:0,max:99999}"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_settings.play.mode_features.prop_generate_rate",\
        "color": "yellow"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:dialog/settings/play/integer_entry/main {name:\"mode_features.prop_generate_rate\",scoreboard_name:\"spawn_prop_rate\",back_path:\"mode_features/main\",min:1,max:64}"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_settings.play.mode_features.lastwords_display_duration",\
        "color": "yellow"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:dialog/settings/play/integer_entry/main {name:\"mode_features.lastwords_display_duration\",scoreboard_name:\"lastwords_display_time\",back_path:\"mode_features/main\",min:10,max:99999}"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_settings.play.mode_features.dead_body_display_duration",\
        "color": "yellow"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:dialog/settings/play/integer_entry/main {name:\"mode_features.dead_body_display_duration\",scoreboard_name:\"dead_body_display_time\",back_path:\"mode_features/main\",min:10,max:99999}"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_settings.play.mode_features.prop_enable",\
        "color": "blue"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:dialog/settings/play/mode_features/prop_enable/main"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_settings.play.mode_features.murderer_count_display",\
        "color": "gold"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:dialog/settings/play/bool_entry/main {name:\"mode_features.murderer_count_display\",scoreboard_name:\"murderer_count_display\",back_path:\"mode_features/main\"}"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_settings.play.mode_features.murderer_pull_dead_body",\
        "color": "gold"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:dialog/settings/play/bool_entry/main {name:\"mode_features.murderer_pull_dead_body\",scoreboard_name:\"murderer_pull_dead_body\",back_path:\"mode_features/main\"}"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_settings.play.mode_features.murderer_friendly_fire",\
        "color": "gold"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:dialog/settings/play/mode_features/murderer_friendly_fire/main"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_settings.play.mode_features.random_choose_role",\
        "color": "gold"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:dialog/settings/play/bool_entry/main {name:\"mode_features.random_choose_role\",scoreboard_name:\"special_role_random\",back_path:\"mode_features/main\"}"\
      }\
    },\
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

scoreboard players set @s mm_API_p 25
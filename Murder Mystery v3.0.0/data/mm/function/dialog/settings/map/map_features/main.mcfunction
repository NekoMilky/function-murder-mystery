data modify storage mm:main dialog.dialog set value {\
  "title": {\
    "translate": "mm.text_settings.map.map_features",\
    "color": "yellow"\
  },\
  "type": "multi_action",\
  "columns": 1,\
  "body": [\
    {\
      "type": "plain_message",\
      "contents": {\
        "translate": "mm.text_settings.map.map_features.description",\
        "color": "green"\
      }\
    }\
  ],\
  "actions": [\
    {\
      "label": {\
        "translate": "mm.text_settings.map.map_features.mars_potion",\
        "color": "aqua"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:dialog/settings/map/map_features/entry/main {predicate:\"button\",name:\"mars_potion\",limit:\"all\",allowed_npc:1,cost:4,count:1,cooldown:-1,api:22}"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_settings.map.map_features.monorail",\
        "color": "aqua"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:dialog/settings/map/map_features/entry/main {predicate:\"button_and_rail\",name:\"monorail\",limit:\"all_rail\",allowed_npc:0,cost:1,count:-1,cooldown:20,api:17}"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_settings.map.map_features.snowman",\
        "color": "aqua"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:dialog/settings/map/map_features/entry/main {predicate:\"button\",name:\"snowman\",limit:\"all\",allowed_npc:1,cost:2,count:1,cooldown:15,api:19}"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_settings.map.map_features.torch",\
        "color": "aqua"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:dialog/settings/map/map_features/entry/main {predicate:\"button\",name:\"torch\",limit:\"all\",allowed_npc:1,cost:3,count:3,cooldown:15,api:20}"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_settings.map.map_features.toygun",\
        "color": "aqua"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:dialog/settings/map/map_features/entry/main {predicate:\"button\",name:\"toygun\",limit:\"all\",allowed_npc:1,cost:2,count:6,cooldown:1,api:21}"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_settings.map.map_features.wall",\
        "color": "aqua"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:dialog/settings/map/map_features/entry/main {predicate:\"button\",name:\"wall\",limit:\"all\",allowed_npc:1,cost:3,count:3,cooldown:15,api:18}"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_settings.map.map_features.web",\
        "color": "aqua"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:dialog/settings/map/map_features/entry/main {predicate:\"button\",name:\"web\",limit:\"all\",allowed_npc:1,cost:2,count:1,cooldown:15,api:23}"\
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
      "command": "/function mm:dialog/settings/map/main"\
    }\
  }\
}

function mm:utils/show_dialog with storage mm:main dialog
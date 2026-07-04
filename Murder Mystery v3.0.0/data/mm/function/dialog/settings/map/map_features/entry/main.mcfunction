$data modify storage mm:main dialog.dialog set value {\
  "title": {\
    "translate": "mm.text_settings.map.map_features.$(name)",\
    "color": "yellow"\
  },\
  "type": "multi_action",\
  "columns": 1,\
  "body": [\
    {\
      "type": "plain_message",\
      "contents": {\
        "translate": "mm.text_settings.map.map_features.$(name).description",\
        "color": "green"\
      }\
    },\
    {\
      "type": "plain_message",\
      "contents": {\
        "translate": "mm.text_settings.map.map_features.limit.$(limit)",\
        "color": "yellow"\
      }\
    }\
  ],\
  "actions": [\
    {\
      "label": {\
        "translate": "mm.text_settings.map.map_features.create",\
        "color": "green"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:settings/map/map_features/create {predicate:$(predicate),name:$(name),count:$(count),cooldown:$(cooldown),cost:$(cost)}"\
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
      "command": "/function mm:dialog/settings/map/map_features/main"\
    }\
  }\
}

$scoreboard players set allowed_npc mm_main $(allowed_npc)
$scoreboard players set this_cooldown mm_main $(cooldown)
$scoreboard players set this_count mm_main $(count)

#创建NPC
$execute if score allowed_npc mm_main matches 1 run data modify storage mm:main dialog.dialog.actions append value {\
  "label": {\
    "translate": "mm.text_settings.map.map_features.create_npc",\
    "color": "green"\
  },\
  "action": {\
    "type": "run_command",\
    "command": "/function mm:dialog/settings/map/map_features/entry/create_npc {predicate:$(predicate),name:$(name),count:$(count),cooldown:$(cooldown),cost:$(cost)}"\
  }\
}

#移除
$data modify storage mm:main dialog.dialog.actions append value {\
  "label": {\
    "translate": "mm.text_settings.map.map_features.remove",\
    "color": "red",\
    "with": [\
      {\
        "translate": "mm.text_settings.map.map_features.$(name)"\
      }\
    ]\
  },\
  "action": {\
    "type": "run_command",\
    "command": "/function mm:settings/map/map_features/remove {predicate:$(predicate),name:$(name)}"\
  }\
}

#花费
$data modify storage mm:main dialog.dialog.actions append value {\
  "label": {\
    "translate": "mm.text_settings.map.map_features.cost",\
    "color": "yellow"\
  },\
  "action": {\
    "type": "run_command",\
    "command": "/function mm:settings/map/map_features/cost/try_modify {predicate:$(predicate),name:$(name)}"\
  }\
}

#数量
$execute unless score this_count mm_main matches -1 run data modify storage mm:main dialog.dialog.actions append value {\
  "label": {\
    "translate": "mm.text_settings.map.map_features.count",\
    "color": "yellow"\
  },\
  "action": {\
    "type": "run_command",\
    "command": "/function mm:settings/map/map_features/count/try_modify {predicate:$(predicate),name:$(name)}"\
  }\
}

#冷却
$execute unless score this_cooldown mm_main matches -1 run data modify storage mm:main dialog.dialog.actions append value {\
  "label": {\
    "translate": "mm.text_settings.map.map_features.cooldown",\
    "color": "yellow"\
  },\
  "action": {\
    "type": "run_command",\
    "command": "/function mm:settings/map/map_features/cooldown/try_modify {predicate:$(predicate),name:$(name)}"\
  }\
}

function mm:utils/show_dialog with storage mm:main dialog

$scoreboard players set @s mm_API_p $(api)
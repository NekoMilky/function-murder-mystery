$data modify storage mm:main dialog.dialog set value {\
  "title": {\
    "translate": "mm.text_settings.map.dangerous_block.$(danger_type)",\
    "color": "yellow"\
  },\
  "type": "multi_action",\
  "columns": 1,\
  "body": [\
    {\
      "tag": "current_lethality",\
      "type": "plain_message",\
      "contents": {\
        "translate": "mm.text_settings.map.dangerous_block.$(danger_type).value",\
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
        "translate": "mm.text_settings.map.dangerous_block.safe",\
        "color": "green"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:settings/map/dangerous_block/set {danger:$(danger),danger_type:$(danger_type),lethality:1,lethality_type:\"safe\"}"\
      }\
    },\
    {\
      "label": {\
        "translate": "mm.text_settings.map.dangerous_block.instant",\
        "color": "red"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/function mm:settings/map/dangerous_block/set {danger:$(danger),danger_type:$(danger_type),lethality:2,lethality_type:\"instant\"}"\
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
      "command": "/function mm:dialog/settings/map/dangerous_block/main"\
    }\
  }\
}

$scoreboard players set allowed_drown mm_main $(allowed_drown)
$execute if score allowed_drown mm_main matches 1 run data modify storage mm:main dialog.dialog.actions append value {\
  "label": {\
    "translate": "mm.text_settings.map.dangerous_block.drown",\
    "color": "blue"\
  },\
  "action": {\
    "type": "run_command",\
    "command": "/function mm:settings/map/dangerous_block/set {danger:$(danger),danger_type:$(danger_type),lethality:3,lethality_type:\"drown\"}"\
  }\
}

$scoreboard players set allowed_slow mm_main $(allowed_slow)
$execute if score allowed_slow mm_main matches 1 run data modify storage mm:main dialog.dialog.actions append value {\
  "label": {\
    "translate": "mm.text_settings.map.dangerous_block.slow",\
    "color": "gold"\
  },\
  "action": {\
    "type": "run_command",\
    "command": "/function mm:settings/map/dangerous_block/set {danger:$(danger),danger_type:$(danger_type),lethality:4,lethality_type:\"slow\"}"\
  }\
}

execute store result storage mm:main temporary.index int 1 run scoreboard players get selected_map mm_main
$data modify storage mm:main temporary.path set value "Deadly$(danger)"
execute store result score current_lethality mm_main run function mm:utils/get_map_data with storage mm:main temporary

data modify storage mm:main temporary.path set value "temporary.translate_key"
data modify storage mm:main temporary.string_1 set value "mm.text_settings.map.dangerous_block."
execute if score current_lethality mm_main matches 1 run data modify storage mm:main temporary.string_2 set value "safe"
execute if score current_lethality mm_main matches 2 run data modify storage mm:main temporary.string_2 set value "instant"
execute if score current_lethality mm_main matches 3 run data modify storage mm:main temporary.string_2 set value "drown"
execute if score current_lethality mm_main matches 4 run data modify storage mm:main temporary.string_2 set value "slow"
function mm:utils/concat_string_to_storage with storage mm:main temporary

execute if score current_lethality mm_main matches 1 run data modify storage mm:main dialog.dialog.body[{tag:"current_lethality"}].contents.with[0].color set value "green"
execute if score current_lethality mm_main matches 2 run data modify storage mm:main dialog.dialog.body[{tag:"current_lethality"}].contents.with[0].color set value "red"
execute if score current_lethality mm_main matches 3 run data modify storage mm:main dialog.dialog.body[{tag:"current_lethality"}].contents.with[0].color set value "blue"
execute if score current_lethality mm_main matches 4 run data modify storage mm:main dialog.dialog.body[{tag:"current_lethality"}].contents.with[0].color set value "gold"

data modify storage mm:main dialog.dialog.body[{tag:"current_lethality"}].contents.with[0].translate set from storage mm:main temporary.translate_key

function mm:utils/show_dialog with storage mm:main dialog
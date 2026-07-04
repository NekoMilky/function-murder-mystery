$data modify storage mm:main dialog.dialog set value {\
  "title": {\
    "translate": "mm.text_cosmetics.$(name)",\
    "color": "yellow"\
  },\
  "type": "multi_action",\
  "columns": 1,\
  "body": [\
    {\
      "type": "plain_message",\
      "contents": {\
        "translate": "mm.text_cosmetics.$(name).description",\
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
            "translate": "mm.text_cosmetics.$(name)"\
          },\
          {\
            "translate": "",\
            "color": "yellow"\
          }\
        ]\
      }\
    }\
  ],\
  "actions": [\
    {\
      "label": {\
        "translate": "mm.text_cosmetics.random",\
        "color": "yellow"\
      },\
      "action": {\
        "type": "run_command",\
        "command": "/trigger mm_cosmetics set $(base)"\
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
      "command": "/trigger mm_cosmetics"\
    }\
  }\
}

$function mm:dialog/cosmetics/add {name:$(name),base:$(base),index:1}

$execute if score @s mm_$(name) matches 0 run data modify storage mm:main dialog.dialog.body[{tag:"current_value"}].contents.with[1].translate set value "mm.text_cosmetics.random"
$execute if score @s mm_$(name) matches 0 run function mm:utils/show_dialog with storage mm:main dialog
$execute if score @s mm_$(name) matches 0 run scoreboard players set @s mm_API_p $(api)
$execute if score @s mm_$(name) matches 0 run return 0

data modify storage mm:main temporary.type set value "storage"
data modify storage mm:main temporary.target set value "mm:main"
data modify storage mm:main temporary.path set value "temporary.string_2"
$execute store result storage mm:main temporary.value int 1 run scoreboard players get @s mm_$(name)
function mm:utils/set_string_data with storage mm:main temporary

data modify storage mm:main temporary.path set value "dialog.dialog.body[{tag:\"current_value\"}].contents.with[1].translate"
$data modify storage mm:main temporary.string_1 set value "mm.text_cosmetics.$(name)."
function mm:utils/concat_string_to_storage with storage mm:main temporary

function mm:utils/show_dialog with storage mm:main dialog

$scoreboard players set @s mm_API_p $(api)
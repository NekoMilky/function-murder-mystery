data modify storage mm:main dialog.dialog set value {\
  "title": {\
    "translate": "mm.text_settings.map.map_features.create_npc",\
    "color": "yellow"\
  },\
  "type": "confirmation",\
  "columns": 1,\
  "inputs": [\
    {\
      "key": "profile_name",\
      "type": "text",\
      "label": {\
        "translate": "mm.text_settings.map.map_features.create_npc.input"\
      }\
    }\
  ],\
  "yes": {\
    "label": {\
      "translate": "mm.text.confirm",\
      "color": "aqua"\
    },\
    "action": {\
      "type": "dynamic/run_command",\
      "template": ""\
    }\
  },\
  "no": {\
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

data modify storage mm:main temporary.path set value "dialog.dialog.yes.action.template"
$data modify storage mm:main temporary.string_1 set value "/function mm:settings/map/map_features/create_npc {predicate:$(predicate),name:$(name),count:$(count),cooldown:$(cooldown),cost:$(cost),"
data modify storage mm:main temporary.string_2 set value "profile_name:$(missing)$(profile_name)}"
function mm:utils/concat_string_to_storage with storage mm:main temporary

function mm:utils/show_dialog with storage mm:main dialog
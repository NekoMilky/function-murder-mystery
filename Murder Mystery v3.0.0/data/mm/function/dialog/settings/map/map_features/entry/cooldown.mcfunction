$data modify storage mm:main dialog.dialog set value {\
  "title": {\
    "translate": "mm.text_settings.map.map_features.$(name)",\
    "color": "yellow"\
  },\
  "type": "confirmation",\
  "columns": 1,\
  "body": [\
    {\
      "tag": "current_cooldown",\
      "type": "plain_message",\
      "contents": {\
        "translate": "mm.text_settings.map.map_features.cooldown.value",\
        "color": "green",\
        "with": [\
          {\
            "text": "$(current_cooldown)",\
            "color": "gold",\
          }\
        ]\
      }\
    },\
  ],\
  "inputs": [\
    {\
      "key": "cooldown",\
      "type": "text",\
      "label": {\
        "translate": "mm.text_settings.map.map_features.cooldown.input"\
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
$data modify storage mm:main temporary.string_1 set value "/function mm:settings/map/map_features/cooldown/modify {predicate:$(predicate),name:$(name),"
data modify storage mm:main temporary.string_2 set value "cooldown:$(missing)$(cooldown)}"
function mm:utils/concat_string_to_storage with storage mm:main temporary

function mm:utils/show_dialog with storage mm:main dialog
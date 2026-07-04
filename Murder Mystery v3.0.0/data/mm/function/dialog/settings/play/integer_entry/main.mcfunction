$data modify storage mm:main dialog.dialog set value {\
  "title": {\
    "translate": "mm.text_settings.play.$(name)",\
    "color": "yellow"\
  },\
  "type": "confirmation",\
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
        "translate": "mm.text_settings.play.$(name).value",\
        "color": "green",\
        "with": [\
          {\
            "text": "0",\
            "color": "gold"\
          }\
        ]\
      }\
    }\
  ],\
  "inputs": [\
    {\
      "key": "value",\
      "type": "text",\
      "label": {\
        "translate": "mm.text_settings.play.$(name).input"\
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
      "command": "/function mm:dialog/settings/play/$(back_path)"\
    }\
  }\
}

data modify storage mm:main temporary.path set value "dialog.dialog.yes.action.template"
$data modify storage mm:main temporary.string_1 set value "/function mm:settings/play/integer_common/set {name:$(name),scoreboard_name:$(scoreboard_name),min:$(min),max:$(max),"
data modify storage mm:main temporary.string_2 set value "value:$(missing)$(value)}"
function mm:utils/concat_string_to_storage with storage mm:main temporary

data modify storage mm:main temporary.type set value "storage"
data modify storage mm:main temporary.target set value "mm:main"
data modify storage mm:main temporary.path set value "dialog.dialog.body[{tag:\"current_value\"}].contents.with[0].text"
$execute store result storage mm:main temporary.value int 1 run scoreboard players get $(scoreboard_name) mm_settings
function mm:utils/set_string_data with storage mm:main temporary

function mm:utils/show_dialog with storage mm:main dialog
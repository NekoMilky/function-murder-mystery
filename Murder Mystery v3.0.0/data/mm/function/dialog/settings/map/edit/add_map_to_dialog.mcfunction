$data modify storage mm:main dialog.dialog.actions append value {\
  "label": {\
    "text": "$(map_name)",\
    "color": "yellow"\
  },\
  "action": {\
    "type": "run_command",\
    "command": "/function $(callback) {map_name:\"$(map_name)\"}"\
  }\
}
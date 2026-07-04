$execute if score game_start mm_main matches -1 run scoreboard players display name .$(line) $(objective) {\
  "translate": "mm.scoreboard.key.running_status",\
  "color": "white",\
  "with": [\
    {\
      "translate": "mm.scoreboard.value.none",\
      "color": "red"\
    }\
  ]\
}

$execute unless score game_start mm_main matches -1 run scoreboard players display name .$(line) $(objective) {\
  "translate": "mm.scoreboard.key.running_status",\
  "color": "white",\
  "with": [\
    {\
      "text": "$(map_name)",\
      "color": "green"\
    }\
  ]\
}
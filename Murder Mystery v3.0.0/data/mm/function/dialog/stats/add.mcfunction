$scoreboard players set this_index mm_main $(index)

$data modify storage mm:main dialog.dialog.body append value {\
  "type": "plain_message",\
  "contents": {\
    "translate": "mm.text_stats.stats.$(index)",\
    "color": "white",\
    "with": [\
      {\
        "text": "0",\
        "color": "green"\
      }\
    ]\
  }\
}

data modify storage mm:main temporary.type set value "storage"
data modify storage mm:main temporary.target set value "mm:main"
data modify storage mm:main temporary.path set value "dialog.dialog.body[-1].contents.with[0].text"
$execute store result storage mm:main temporary.value int 1 run scoreboard players get $(player_name) mm_stats_$(index)
function mm:utils/set_string_data with storage mm:main temporary

execute unless score this_index mm_main < stats_count mm_main run return 0

$data modify storage mm:main temporary.player_name set value "$(player_name)"
scoreboard players add this_index mm_main 1
execute store result storage mm:main temporary.index int 1 run scoreboard players get this_index mm_main
function mm:dialog/stats/add with storage mm:main temporary
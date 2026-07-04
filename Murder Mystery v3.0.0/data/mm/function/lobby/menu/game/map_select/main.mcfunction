function mm:lobby/menu/common/self {slot:22,loot_table:"mm:menu/game/map_select/back",item_tag:"Back",menu:0}

function mm:lobby/menu/common/player {close_menu:1,tag:"mm_npc_game",slot:21,loot_table:"mm:menu/game/map_select/random",item_tag:"Random",callback:"function mm:lobby/play_game/random"}

#以页码遍历地图
$scoreboard players set this_start mm_main $(page)
scoreboard players remove this_start mm_main 1
scoreboard players operation this_start mm_main *= 18 mm_main

$scoreboard players set this_end mm_main $(page)
scoreboard players operation this_end mm_main *= 18 mm_main

data modify storage mm:main temporary.slot set value 0
execute store result storage mm:main temporary.index int 1 run scoreboard players get this_start mm_main
execute store result storage mm:main temporary.end int 1 run scoreboard players get this_end mm_main
function mm:lobby/menu/game/map_select/map with storage mm:main temporary

#换页按钮
$scoreboard players set this_page mm_main $(page)
scoreboard players operation total_page mm_main = map_count mm_main
scoreboard players add total_page mm_main 17
scoreboard players operation total_page mm_main /= 18 mm_main

$scoreboard players set previous_page mm_main $(page)
scoreboard players remove previous_page mm_main 1
data modify storage mm:main temporary.slot set value 18
data modify storage mm:main temporary.type set value "previous"
data modify storage mm:main temporary.item_tag set value "Previous"
execute store result storage mm:main temporary.page int 1 run scoreboard players get previous_page mm_main
execute if score this_page mm_main matches 2.. run function mm:lobby/menu/game/map_select/change_page with storage mm:main temporary

$scoreboard players set next_page mm_main $(page)
scoreboard players add next_page mm_main 1
data modify storage mm:main temporary.slot set value 26
data modify storage mm:main temporary.type set value "next"
data modify storage mm:main temporary.item_tag set value "Next"
execute store result storage mm:main temporary.page int 1 run scoreboard players get next_page mm_main
execute if score this_page mm_main < total_page mm_main run function mm:lobby/menu/game/map_select/change_page with storage mm:main temporary
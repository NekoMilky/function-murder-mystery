execute if score game_start mm_main matches -1 run function mm:lobby/menu/common/self {slot:10,loot_table:"mm:menu/game/home/play",item_tag:"Play",menu:1}
execute unless score game_start mm_main matches -1 run function mm:lobby/menu/common/player {close_menu:1,tag:"mm_npc_game",slot:10,loot_table:"mm:menu/game/home/play",item_tag:"Play",callback:"function mm:lobby/play_game/join"}

function mm:lobby/menu/common/player {close_menu:0,tag:"mm_npc_game",slot:12,loot_table:"mm:menu/game/home/cosmetics",item_tag:"Cosmetics",callback:"function mm:dialog/cosmetics/main"}

function mm:lobby/menu/common/player {close_menu:0,tag:"mm_npc_game",slot:14,loot_table:"mm:menu/game/home/stats",item_tag:"Stats",callback:"function mm:dialog/stats/main"}

function mm:lobby/menu/common/player {close_menu:0,tag:"mm_npc_game",slot:16,loot_table:"mm:menu/game/home/help",item_tag:"Help",callback:"function mm:dialog/help/main"}

execute unless score timer mm_main matches 0 run return 0

function mm:lobby/update_current_playing/main {path:"Items[{Slot:10b}].components.\"minecraft:lore\"[0]",resolve_path:"Items[{Slot:10b}].components.\\\"minecraft:lore\\\"[0]"}

execute if score game_start mm_main matches -1 run data modify entity @s Items[{Slot:10b}].components."minecraft:lore"[1].with set value [{"translate":"mm.scoreboard.value.none","color":"red"}]
execute if score game_start mm_main matches -1 run return 0

data modify storage mm:main temporary.path set value "temporary.map_name"
data modify storage mm:main temporary.source_path set value "Name"
execute store result storage mm:main temporary.index int 1 run scoreboard players get selected_map mm_main
function mm:utils/get_map_data_to_storage with storage mm:main temporary
function mm:lobby/menu/game/home/map_name_resolve with storage mm:main temporary
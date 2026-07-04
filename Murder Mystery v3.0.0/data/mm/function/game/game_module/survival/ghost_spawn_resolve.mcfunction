scoreboard players add spawn_ghost_weight mm_main 1
$execute store result score spawn_ghost_count mm_main run function mm:utils/get_list_length_in_storage {path:"map.maps[$(index)].Spawn",index:0}
scoreboard players operation spawn_ghost_count mm_main *= spawn_ghost_weight mm_main
scoreboard players operation spawn_ghost_count mm_main /= 100 mm_main

execute if score spawn_ghost_count mm_main matches 0 run scoreboard players set spawn_ghost_count mm_main 1

function mm:scoreboard/calculate_data/main
scoreboard players operation expected_ghost_count mm_main = ghost_left mm_data
scoreboard players operation expected_ghost_count mm_main += spawn_ghost_count mm_main
execute if score expected_ghost_count mm_main matches 51.. run scoreboard players set ghost_spawn_tick mm_main 600
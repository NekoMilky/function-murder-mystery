execute store result storage mm:main temporary.max int 1 run scoreboard players get map_count mm_main
execute store result storage mm:main temporary.index int 1 run function mm:utils/random_count with storage mm:main temporary
function mm:lobby/play_game/select with storage mm:main temporary
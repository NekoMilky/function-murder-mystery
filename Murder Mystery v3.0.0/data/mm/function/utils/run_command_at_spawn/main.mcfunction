$data modify storage mm:main temporary.callback set value "$(callback)"
execute store result storage mm:main temporary.index int 1 run scoreboard players get selected_map mm_main

function mm:utils/run_command_at_spawn/random_select with storage mm:main temporary
$data modify storage mm:main temporary.path set value "$(path)"
execute store result storage mm:main temporary.index int 1 run scoreboard players get selected_map mm_main

return run function mm:utils/check_selected_map_data/resolve with storage mm:main temporary
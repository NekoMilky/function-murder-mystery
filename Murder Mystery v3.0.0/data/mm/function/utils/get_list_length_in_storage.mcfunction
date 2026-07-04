$execute unless data storage mm:main $(path)[$(index)] run return $(index)

$data modify storage mm:main temporary.path set value "$(path)"

$scoreboard players set this_index mm_main $(index)
scoreboard players add this_index mm_main 1
execute store result storage mm:main temporary.index int 1 run scoreboard players get this_index mm_main

return run function mm:utils/get_list_length_in_storage with storage mm:main temporary
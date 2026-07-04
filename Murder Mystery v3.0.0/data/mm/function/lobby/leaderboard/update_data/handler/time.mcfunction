$scoreboard players operation this_minute mm_main = $(name) mm_temporary
scoreboard players operation this_minute mm_main /= 60 mm_main

$scoreboard players operation this_second mm_main = $(name) mm_temporary
scoreboard players operation this_second mm_main %= 60 mm_main

execute store result storage mm:main temporary.value int 1 run scoreboard players get this_minute mm_main
data modify storage mm:main temporary.type set value "storage"
data modify storage mm:main temporary.target set value "mm:main"
data modify storage mm:main temporary.path set value "temporary.string_1"
function mm:utils/set_string_data with storage mm:main temporary

data modify storage mm:main temporary.string_2 set value ":"
data modify storage mm:main temporary.path set value "temporary.string_1"
function mm:utils/concat_string_to_storage with storage mm:main temporary

execute if score this_second mm_main matches ..9 run data modify storage mm:main temporary.string_2 set value "0"
execute if score this_second mm_main matches ..9 run data modify storage mm:main temporary.path set value "temporary.string_1"
execute if score this_second mm_main matches ..9 run function mm:utils/concat_string_to_storage with storage mm:main temporary

execute store result storage mm:main temporary.value int 1 run scoreboard players get this_second mm_main
data modify storage mm:main temporary.type set value "storage"
data modify storage mm:main temporary.target set value "mm:main"
data modify storage mm:main temporary.path set value "temporary.string_2"
function mm:utils/set_string_data with storage mm:main temporary

data modify storage mm:main temporary.path set value "temporary.entry_value"
function mm:utils/concat_string_to_storage with storage mm:main temporary
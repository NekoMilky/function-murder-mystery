#确定当前上下界
$execute if score prop_$(prop_number)_enable mm_settings matches 1 run scoreboard players operation $(prop_number) mm_chance_lower = current_lower mm_main

$execute if score prop_$(prop_number)_enable mm_settings matches 1 store result score this_chance mm_main run data get storage mm:main temporary.weights[$(index)]
$execute if score prop_$(prop_number)_enable mm_settings matches 1 run scoreboard players operation $(prop_number) mm_chance_higher = current_lower mm_main
$execute if score prop_$(prop_number)_enable mm_settings matches 1 run scoreboard players operation $(prop_number) mm_chance_higher += this_chance mm_main

#更新当前下界
$execute if score prop_$(prop_number)_enable mm_settings matches 1 run scoreboard players operation current_lower mm_main = $(prop_number) mm_chance_higher

#修正当前上界
$execute if score prop_$(prop_number)_enable mm_settings matches 1 run scoreboard players remove $(prop_number) mm_chance_higher 1

#递归
$scoreboard players set this_index mm_main $(index)
scoreboard players add this_index mm_main 1
execute store result storage mm:main temporary.index int 1 run scoreboard players get this_index mm_main

$scoreboard players set this_prop_number mm_main $(prop_number)
scoreboard players add this_prop_number mm_main 1
execute store result storage mm:main temporary.prop_number int 1 run scoreboard players get this_prop_number mm_main

execute if score this_index mm_main < weights_length mm_main run function mm:game/game_module/prop/type/range with storage mm:main temporary
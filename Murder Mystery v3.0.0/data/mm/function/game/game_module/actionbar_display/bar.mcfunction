$scoreboard players operation this_value mm_main = @s $(name)
scoreboard players operation this_value mm_main *= 100 mm_main
$scoreboard players operation this_value mm_main /= $(full) mm_settings

$scoreboard players operation this_second mm_main = @s $(name)
scoreboard players operation this_second mm_main /= 20 mm_main

$scoreboard players operation this_second_dot mm_main = @s $(name)
scoreboard players operation this_second_dot mm_main %= 20 mm_main
scoreboard players operation this_second_dot mm_main /= 2 mm_main

execute if score this_value mm_main matches 95.. run data modify storage mm:main temporary.bar set value {"text":"■■■■■■■■■■","color":"red"}
execute if score this_value mm_main matches 85..94 run data modify storage mm:main temporary.bar set value [{"text":"■","color":"green"},{"text":"■■■■■■■■■","color":"red"}]
execute if score this_value mm_main matches 75..84 run data modify storage mm:main temporary.bar set value [{"text":"■■","color":"green"},{"text":"■■■■■■■■","color":"red"}]
execute if score this_value mm_main matches 65..74 run data modify storage mm:main temporary.bar set value [{"text":"■■■","color":"green"},{"text":"■■■■■■■","color":"red"}]
execute if score this_value mm_main matches 55..64 run data modify storage mm:main temporary.bar set value [{"text":"■■■■","color":"green"},{"text":"■■■■■■","color":"red"}]
execute if score this_value mm_main matches 45..54 run data modify storage mm:main temporary.bar set value [{"text":"■■■■■","color":"green"},{"text":"■■■■■","color":"red"}]
execute if score this_value mm_main matches 35..44 run data modify storage mm:main temporary.bar set value [{"text":"■■■■■■","color":"green"},{"text":"■■■■","color":"red"}]
execute if score this_value mm_main matches 25..34 run data modify storage mm:main temporary.bar set value [{"text":"■■■■■■■","color":"green"},{"text":"■■■","color":"red"}]
execute if score this_value mm_main matches 15..24 run data modify storage mm:main temporary.bar set value [{"text":"■■■■■■■■","color":"green"},{"text":"■■","color":"red"}]
execute if score this_value mm_main matches 5..14 run data modify storage mm:main temporary.bar set value [{"text":"■■■■■■■■■","color":"green"},{"text":"■","color":"red"}]
execute if score this_value mm_main matches ..4 run data modify storage mm:main temporary.bar set value {"text":"■■■■■■■■■■","color":"green"}

$title @s actionbar {"translate":"mm.title.$(type).actionbar","color":"gold","with":[{"nbt":"temporary.bar","interpret":true,"storage":"mm:main"},{"score":{"objective":"mm_main","name":"this_second"}},{"score":{"objective":"mm_main","name":"this_second_dot"}}]}
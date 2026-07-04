$scoreboard players operation this_value mm_main = @s mm_health_$(type)
scoreboard players operation this_value mm_main *= 100 mm_main
$scoreboard players operation this_value mm_main /= $(full) mm_settings

execute if score this_value mm_main matches ..4 run data modify storage mm:main temporary.health set value {"text":"■■■■■■■■■■","color":"red"}
execute if score this_value mm_main matches 5..14 run data modify storage mm:main temporary.health set value [{"text":"■","color":"green"},{"text":"■■■■■■■■■","color":"red"}]
execute if score this_value mm_main matches 15..24 run data modify storage mm:main temporary.health set value [{"text":"■■","color":"green"},{"text":"■■■■■■■■","color":"red"}]
execute if score this_value mm_main matches 25..34 run data modify storage mm:main temporary.health set value [{"text":"■■■","color":"green"},{"text":"■■■■■■■","color":"red"}]
execute if score this_value mm_main matches 35..44 run data modify storage mm:main temporary.health set value [{"text":"■■■■","color":"green"},{"text":"■■■■■■","color":"red"}]
execute if score this_value mm_main matches 45..54 run data modify storage mm:main temporary.health set value [{"text":"■■■■■","color":"green"},{"text":"■■■■■","color":"red"}]
execute if score this_value mm_main matches 55..64 run data modify storage mm:main temporary.health set value [{"text":"■■■■■■","color":"green"},{"text":"■■■■","color":"red"}]
execute if score this_value mm_main matches 65..74 run data modify storage mm:main temporary.health set value [{"text":"■■■■■■■","color":"green"},{"text":"■■■","color":"red"}]
execute if score this_value mm_main matches 75..84 run data modify storage mm:main temporary.health set value [{"text":"■■■■■■■■","color":"green"},{"text":"■■","color":"red"}]
execute if score this_value mm_main matches 85..94 run data modify storage mm:main temporary.health set value [{"text":"■■■■■■■■■","color":"green"},{"text":"■","color":"red"}]
execute if score this_value mm_main matches 95.. run data modify storage mm:main temporary.health set value {"text":"■■■■■■■■■■","color":"green"}

title @s actionbar {"translate":"mm.title.danger.actionbar","color":"gold","with":[{"nbt":"temporary.health","interpret":true,"storage":"mm:main"},{"score":{"objective":"mm_main","name":"this_value"}}]}
#生成一个金锭
function mm:utils/run_command_at_spawn/main {callback:"summon armor_stand ~ ~ ~ {Tags:[\\\"mm_spawn_marker\\\"],Invisible:1b,Marker:1b,Small:1b,Invulnerable:1b,NoGravity:1b}"}

execute as @e[tag=mm_spawn_marker] at @s if entity @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{Pickup:0}}}},distance=..2] store result score gold_ingot_count mm_main run data get entity @n[type=item,nbt={Item:{components:{"minecraft:custom_data":{Pickup:0}}}}] Item.count
execute as @e[tag=mm_spawn_marker] at @s if entity @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{Pickup:0}}}},distance=..2] if score gold_ingot_count mm_main matches 1..2 run scoreboard players add gold_ingot_count mm_main 1
execute as @e[tag=mm_spawn_marker] at @s if entity @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{Pickup:0}}}},distance=..2] store result entity @n[type=item,nbt={Item:{components:{"minecraft:custom_data":{Pickup:0}}}}] Item.count byte 1 run scoreboard players get gold_ingot_count mm_main
execute as @e[tag=mm_spawn_marker] at @s unless entity @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{Pickup:0}}}},distance=..2] run loot spawn ~ ~ ~ loot mm:gold_ingot

kill @e[tag=mm_spawn_marker]

execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{Pickup:0}}}}] run data modify entity @s PickupDelay set value 32767s
execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{Pickup:0}}}}] run data modify entity @s Age set value -32768s

#递归
$scoreboard players set this_index mm_main $(index)
scoreboard players add this_index mm_main 1
execute store result storage mm:main temporary.index int 1 run scoreboard players get this_index mm_main

execute if score this_index mm_main < spawn_gold_ingot_rate mm_settings run function mm:game/game_module/gold_ingot/spawn with storage mm:main temporary
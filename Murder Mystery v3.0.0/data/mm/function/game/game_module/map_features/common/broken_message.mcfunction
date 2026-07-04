execute store result score pos_x mm_main run data get entity @s Pos[0]
execute store result score pos_y mm_main run data get entity @s Pos[1]
execute store result score pos_z mm_main run data get entity @s Pos[2]

$tellraw @a {"translate":"mm.text.machine_broken","color":"red","with":[{"translate":"mm.text_settings.map.map_features.$(name)"},{"score":{"name":"pos_x","objective":"mm_main"}},{"score":{"name":"pos_y","objective":"mm_main"}},{"score":{"name":"pos_z","objective":"mm_main"}}]}
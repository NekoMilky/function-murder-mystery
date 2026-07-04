execute if score game_start mm_main matches 2 run tellraw @s {"translate":"mm.feedback.wait_for_game_ending","color":"red"}
execute if score game_start mm_main matches 2 run return 0

$execute if data storage mm:main map.maps[{Name:"$(map_name)"}] run tellraw @s {"translate":"mm.feedback.map.edit.add.fail","color":"red","with":[{"text":"$(map_name)"}]}
$execute if data storage mm:main map.maps[{Name:"$(map_name)"}] run return 0

scoreboard players add map_count mm_main 1

$data modify storage mm:main map.maps append value {Name:"$(map_name)",Time:7,Weather:1,DeadlyLava:1,DeadlyWater:1,DeadlyFire:1}

$tellraw @s {"translate":"mm.feedback.map.edit.add.success","color":"yellow","with":[{"text":"$(map_name)"},{"score":{"objective":"mm_main","name":"map_count"},"color":"gold"}]}

$function mm:settings/map/edit/select {map_name:"$(map_name)"}
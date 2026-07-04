$data modify storage mm:main temporary.objective set value $(objective)
$data modify storage mm:main temporary.line set value $(line)

execute if score game_mode mm_main matches 0 run data modify storage mm:main temporary.game_mode set value "classic"
execute if score game_mode mm_main matches 1 run data modify storage mm:main temporary.game_mode set value "double_up"
execute if score game_mode mm_main matches 2 run data modify storage mm:main temporary.game_mode set value "infection_v1"
execute if score game_mode mm_main matches 3 run data modify storage mm:main temporary.game_mode set value "showdown"
execute if score game_mode mm_main matches 4 run data modify storage mm:main temporary.game_mode set value "human_robot_war"
execute if score game_mode mm_main matches 5 run data modify storage mm:main temporary.game_mode set value "prop"
execute if score game_mode mm_main matches 6 run data modify storage mm:main temporary.game_mode set value "survival"
execute if score game_mode mm_main matches 7 run data modify storage mm:main temporary.game_mode set value "infection_v2"
execute if score game_mode mm_main matches 8 run data modify storage mm:main temporary.game_mode set value "prop_double_up"
execute if score game_mode mm_main matches 9 run data modify storage mm:main temporary.game_mode set value "boss"
execute if score game_mode mm_main matches 10 run data modify storage mm:main temporary.game_mode set value "showdown_armed"

execute if score game_mode mm_main matches 0..3 run data modify storage mm:main temporary.color set value "green"
execute if score game_mode mm_main matches 4 run data modify storage mm:main temporary.color set value "gold"
execute if score game_mode mm_main matches 5..6 run data modify storage mm:main temporary.color set value "light_purple"
execute if score game_mode mm_main matches 7 run data modify storage mm:main temporary.color set value "green"
execute if score game_mode mm_main matches 8 run data modify storage mm:main temporary.color set value "light_purple"
execute if score game_mode mm_main matches 9 run data modify storage mm:main temporary.color set value "gold"
execute if score game_mode mm_main matches 10 run data modify storage mm:main temporary.color set value "light_purple"

function mm:scoreboard/entries/game_mode/display with storage mm:main temporary
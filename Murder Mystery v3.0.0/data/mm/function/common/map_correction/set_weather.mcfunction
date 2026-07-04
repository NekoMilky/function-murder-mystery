$scoreboard players set current_weather mm_main $(weather)

execute if score current_weather mm_main matches 1 run weather clear
execute if score current_weather mm_main matches 2 run weather rain
execute if score current_weather mm_main matches 3 run weather thunder
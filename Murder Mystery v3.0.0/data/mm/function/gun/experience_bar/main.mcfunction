$scoreboard players operation this_progress mm_main = $(owner).$(type) mm_gun_ammo

#2L+6
$execute if score $(owner).$(type) mm_gun_ammo matches 1..15 run scoreboard players operation this_progress mm_main *= 2 mm_main
$execute if score $(owner).$(type) mm_gun_ammo matches 1..15 run scoreboard players add this_progress mm_main 6

#5L-39
$execute if score $(owner).$(type) mm_gun_ammo matches 16..30 run scoreboard players operation this_progress mm_main *= 5 mm_main
$execute if score $(owner).$(type) mm_gun_ammo matches 16..30 run scoreboard players remove this_progress mm_main 39

#9L-159
$execute if score $(owner).$(type) mm_gun_ammo matches 31.. run scoreboard players operation this_progress mm_main *= 9 mm_main
$execute if score $(owner).$(type) mm_gun_ammo matches 31.. run scoreboard players remove this_progress mm_main 159

$scoreboard players operation this_rate mm_main = $(owner).$(type) mm_gun_rate
scoreboard players operation this_rate mm_main *= 100 mm_main
$scoreboard players operation this_rate mm_main /= #ALL.$(type) mm_gun_rate
scoreboard players operation this_rate mm_main *= -1 mm_main
scoreboard players add this_rate mm_main 100
scoreboard players operation this_progress mm_main *= this_rate mm_main
scoreboard players operation this_progress mm_main /= 100 mm_main

$execute store result storage mm:main temporary.ammo int 1 run scoreboard players get $(owner).$(type) mm_gun_ammo
execute store result storage mm:main temporary.progress int 1 run scoreboard players get this_progress mm_main

function mm:gun/experience_bar/set with storage mm:main temporary
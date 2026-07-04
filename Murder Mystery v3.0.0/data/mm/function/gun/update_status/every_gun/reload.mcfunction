$execute if score $(owner).$(type) mm_gun_reload matches 0 run return 0

$scoreboard players remove $(owner).$(type) mm_gun_reload 1

#重装完毕
$execute if score $(owner).$(type) mm_gun_reload matches 0 run scoreboard players operation this_clip_ammo_max mm_main = #ALL.$(type) mm_gun_clip_ammo
$execute if score $(owner).$(type) mm_gun_reload matches 0 run scoreboard players operation this_clip_ammo_max mm_main < $(owner).$(type) mm_gun_ammo
$execute if score $(owner).$(type) mm_gun_reload matches 0 run scoreboard players operation $(owner).$(type) mm_gun_clip_ammo = this_clip_ammo_max mm_main 

$execute if score $(owner).$(type) mm_gun_reload matches 0 run return 1

#耐久
$scoreboard players operation this_damage mm_main = $(owner).$(type) mm_gun_reload
scoreboard players operation this_damage mm_main *= 100 mm_main
$scoreboard players operation this_damage mm_main /= #ALL.$(type) mm_gun_reload
scoreboard players operation this_damage mm_main *= -1 mm_main
scoreboard players add this_damage mm_main 100

execute store result storage mm:main temporary.set_damage float 0.01 run scoreboard players get this_damage mm_main
$item modify entity @s container.$(slot) mm:gun/set_unstackable
$item modify entity @s container.$(slot) mm:gun/set_damage

return 1
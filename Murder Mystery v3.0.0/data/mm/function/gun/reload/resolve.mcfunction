$execute if score $(owner).$(type) mm_gun_ammo matches 0 run return 0

$execute if score $(owner).$(type) mm_gun_reload matches 1.. run return 0

$execute if score $(owner).$(type) mm_gun_clip_ammo = #ALL.$(type) mm_gun_clip_ammo run return 0

$scoreboard players operation $(owner).$(type) mm_gun_reload = #ALL.$(type) mm_gun_reload
execute at @s run playsound minecraft:entity.horse.gallop player @s ~ ~ ~ 1 0

scoreboard players set count_value mm_main 1
item modify entity @s weapon.mainhand mm:set_count

function mm:gun/update_status/main
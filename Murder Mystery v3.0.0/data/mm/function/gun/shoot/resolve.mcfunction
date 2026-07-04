$execute if score $(owner).$(type) mm_gun_reload matches 1.. run return 0
$execute if score $(owner).$(type) mm_gun_rate matches 1.. run return 0
$execute if score $(owner).$(type) mm_gun_clip_ammo matches 0 run return 0
$execute if score $(owner).$(type) mm_gun_ammo matches 0 run return 0

$scoreboard players operation $(owner).$(type) mm_gun_rate = #ALL.$(type) mm_gun_rate
$scoreboard players remove $(owner).$(type) mm_gun_clip_ammo 1
$scoreboard players remove $(owner).$(type) mm_gun_ammo 1

#射击声音
$execute at @s run function mm:gun/shoot/sound/$(type)

#子弹
tag @s add mm_gun_shoot

execute at @s anchored eyes run summon minecraft:marker ^ ^ ^ {Tags:["mm_gun_bullet"]}
execute at @s as @n[tag=mm_gun_bullet] at @s rotated as @p[tag=mm_gun_shoot] run tp @s ~ ~ ~ ~ ~
$execute at @s as @n[tag=mm_gun_bullet] run function mm:gun/shoot/forward {type:"$(type)",current_range:0}

execute as @s[tag=mm_gun_shoot] run tag @s remove mm_gun_shoot

function mm:gun/update_status/main
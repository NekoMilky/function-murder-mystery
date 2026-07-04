#弹药
$execute if score $(owner).$(type) mm_gun_ammo matches 0 run data modify storage mm:main temporary.set_damage set value 0.1
$execute if score $(owner).$(type) mm_gun_ammo matches 0 run item modify entity @s container.$(slot) mm:gun/set_unstackable
$execute if score $(owner).$(type) mm_gun_ammo matches 0 run item modify entity @s container.$(slot) mm:gun/set_damage
$execute if score $(owner).$(type) mm_gun_ammo matches 0 run return 0

#射速
$execute if score $(owner).$(type) mm_gun_rate matches 1.. run scoreboard players remove $(owner).$(type) mm_gun_rate 1
$execute if score $(owner).$(type) mm_gun_rate matches 1.. as @s[tag=mm_gun_update_passed] run tag @s remove mm_gun_update_passed

#正在重新装填
$execute store result score this_reloading mm_main run function mm:gun/update_status/every_gun/reload {slot:$(slot),owner:"$(owner)",type:"$(type)"}
execute if score this_reloading mm_main matches 1 as @s[tag=mm_gun_update_passed] run tag @s remove mm_gun_update_passed
execute if score this_reloading mm_main matches 1 run return 0

#弹夹弹药
$execute if score $(owner).$(type) mm_gun_clip_ammo matches 0 run scoreboard players operation $(owner).$(type) mm_gun_reload = #ALL.$(type) mm_gun_reload 
$execute if score $(owner).$(type) mm_gun_clip_ammo matches 0 at @s run playsound minecraft:entity.horse.gallop player @s ~ ~ ~ 1 0

$execute if score $(owner).$(type) mm_gun_clip_ammo matches 0 as @s[tag=mm_gun_update_passed] run tag @s remove mm_gun_update_passed
$execute if score $(owner).$(type) mm_gun_clip_ammo matches 0 run return 0

#修改物品数
$scoreboard players operation count_value mm_main = $(owner).$(type) mm_gun_clip_ammo

$item modify entity @s container.$(slot) mm:gun/set_stackable
$item modify entity @s container.$(slot) mm:set_count
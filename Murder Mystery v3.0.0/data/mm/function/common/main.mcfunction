#计时
##常规
execute unless score timer mm_main matches 1..10 run scoreboard players set timer mm_main 10
scoreboard players remove timer mm_main 1

##短
execute unless score timer_short mm_main matches 1.. run scoreboard players add sight_effect_phase mm_main 1
execute unless score sight_effect_phase mm_main matches 1..8 run scoreboard players set sight_effect_phase mm_main 1

execute unless score timer_short mm_main matches 1.. run scoreboard players set timer_short mm_main 4
scoreboard players remove timer_short mm_main 1

##卸载
execute if score timer_uninstall mm_main matches 1.. run scoreboard players remove timer_uninstall mm_main 1

#接口状态重置
scoreboard players reset * mm_API

#检测右键
execute as @a[tag=mm_right_click] run tag @s remove mm_right_click
execute as @a[scores={mm_carrot=1..}] run tag @s add mm_right_click
execute as @a[scores={mm_carrot=1..}] run scoreboard players set @s mm_carrot 0

#检测药水
execute as @a[tag=mm_potion] run tag @s remove mm_potion
execute as @a[scores={mm_potion=1..}] run tag @s add mm_potion
execute as @a[scores={mm_potion=1..}] run scoreboard players set @s mm_potion 0

#主函数
function mm:lobby/main

execute if score game_start mm_main matches 0..1 run function mm:waiting/main

execute if score game_start mm_main matches 2 if score game_mode mm_main matches 0..1 run function mm:game/game_mode/classic/main
execute if score game_start mm_main matches 2 if score game_mode mm_main matches 2 run function mm:game/game_mode/infection_v1/main
execute if score game_start mm_main matches 2 if score game_mode mm_main matches 3 run function mm:game/game_mode/showdown/main
execute if score game_start mm_main matches 2 if score game_mode mm_main matches 4 run function mm:game/game_mode/human_robot_war/main
execute if score game_start mm_main matches 2 if score game_mode mm_main matches 5 run function mm:game/game_mode/classic/main
execute if score game_start mm_main matches 2 if score game_mode mm_main matches 6 run function mm:game/game_mode/survival/main
execute if score game_start mm_main matches 2 if score game_mode mm_main matches 7 run function mm:game/game_mode/infection_v2/main
execute if score game_start mm_main matches 2 if score game_mode mm_main matches 8..9 run function mm:game/game_mode/classic/main
execute if score game_start mm_main matches 2 if score game_mode mm_main matches 10 run function mm:game/game_mode/showdown/main

#全局游戏模块
execute if score game_start mm_main matches 2 run function mm:game/game_module/main

#默认值
##成为杀手几率
execute as @a unless score @s mm_m_chance matches 1.. run scoreboard players set @s mm_m_chance 1
##成为侦探几率
execute as @a unless score @s mm_d_chance matches 1.. run scoreboard players set @s mm_d_chance 1
##成为母体几率
execute as @a unless score @s mm_a_chance matches 1.. run scoreboard players set @s mm_a_chance 1
##身份几率增幅
execute as @a unless score @s mm_chance_amp matches 1.. run scoreboard players set @s mm_chance_amp 1

#计分板刷新
execute if score game_start mm_main matches -1..0 if score timer mm_main matches 0 run function mm:scoreboard/main

#枪械
function mm:gun/main

#菜单
function mm:help/main
function mm:cosmetics/main
function mm:stats/main
function mm:spectator/main
function mm:game_mode/main

#游戏模式
execute if score game_start mm_main matches -1..1 run gamemode adventure @a[gamemode=spectator]
execute if score game_start mm_main matches -1..1 run gamemode adventure @a[gamemode=survival]

#弹射物轨迹物
execute if score game_start mm_main matches 2..3 as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{Projectile:1}}}}] run data modify entity @s PickupDelay set value 32767
execute if score game_start mm_main matches 2..3 as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{Projectile:1}}}}] run data modify entity @s Age set value 5920
execute if score game_start mm_main matches 2..3 as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{Projectile:1}}}}] run data modify entity @s Item.components."minecraft:custom_data".Projectile set value 0

#地图矫正
execute if score game_start mm_main matches 0..1 if score timer mm_main matches 0 run function mm:common/map_correction/main

#饱和效果
execute if score timer mm_main matches 0 run effect give @a saturation 1 0 true

#接口转换
execute as @e[scores={mm_API_p=1..}] run scoreboard players operation @s mm_API = @s mm_API_p
execute as @e[scores={mm_API_p=1..}] run scoreboard players reset @s mm_API_p
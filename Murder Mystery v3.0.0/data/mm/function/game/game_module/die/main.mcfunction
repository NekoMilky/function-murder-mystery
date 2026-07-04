#箭剑抵消
execute as @e[type=arrow] at @s positioned ^ ^ ^1 if entity @e[tag=mm_thrown_knife,distance=..1.8] run tag @s add mm_thrown_knife_offset
execute as @e[tag=mm_thrown_knife_offset] at @s run playsound minecraft:entity.item.break block @a[tag=mm_playing] ~ ~ ~ 1.25
execute as @e[tag=mm_thrown_knife_offset] at @s positioned ^ ^ ^1 run kill @n[tag=mm_thrown_knife]
execute as @e[tag=mm_thrown_knife_offset] at @s run particle dust{color:[1.0,1.0,1.0],scale:1.0} ~ ~1.3 ~ 0.15 0.15 0.15 0 10 normal @a[tag=mm_playing]
execute as @e[tag=mm_thrown_knife_offset] run kill @s

#箭
execute as @e[type=arrow,tag=!mm_set_life] run data modify entity @s life set value 1000s
execute as @e[type=arrow,tag=!mm_set_life] run tag @s add mm_set_life
execute as @e[type=arrow,nbt={inGround:1b}] unless score @s mm_projectile matches 12 run scoreboard players set @s mm_projectile 1
execute as @e[type=arrow,nbt={inGround:1b},nbt=!{pickup:0b}] run data modify entity @s pickup set value 0b 

#飞刀飞行
function mm:game/game_module/thrown_knife
function mm:game/game_module/thrown_knife
function mm:game/game_module/thrown_knife

#危险之地
execute as @a[tag=mm_playing,tag=!mm_spectator,tag=!mm_dead,tag=!mm_will_respawn] at @s if block ~ ~-0.1 ~ #mm:deadly_block run scoreboard players set @s mm_death_type 101

#掉入虚空
execute as @a[tag=mm_playing,tag=!mm_spectator,tag=!mm_dead,tag=!mm_will_respawn] at @s unless entity @s[y=-64,dy=384] run scoreboard players set @s mm_death_type 103
execute as @a[tag=mm_playing,tag=!mm_spectator,tag=!mm_dead,tag=!mm_will_respawn] at @s unless entity @s[y=-64,dy=384] run function mm:utils/teleport_to_spawn_waiting/main

#掉入岩浆
execute as @a[tag=mm_playing,tag=!mm_spectator,tag=!mm_dead,tag=!mm_will_respawn] run function mm:game/game_module/die/dangerous_block {path:"DeadlyLava",type:"l",tag:"#mm:lava_block",full:"lava_health",death_type:102,callback:"scoreboard players set @s mm_death_type 102"}

#溺水
execute as @a[tag=mm_playing,tag=!mm_spectator,tag=!mm_dead,tag=!mm_will_respawn] run function mm:game/game_module/die/dangerous_block {path:"DeadlyWater",type:"w",tag:"#mm:drown_block",full:"water_health",death_type:104,callback:"scoreboard players set @s mm_death_type 104"}

#掉入火
execute as @a[tag=mm_playing,tag=!mm_spectator,tag=!mm_dead,tag=!mm_will_respawn] run function mm:game/game_module/die/dangerous_block {path:"DeadlyFire",type:"f",tag:"#mm:fire_block",full:"fire_health",death_type:109,callback:"function mm:game/game_module/die/fire_slow_death"}

#击晕
execute as @a[tag=mm_be_stunned] run tellraw @s {"translate":"mm.text.stun","color":"red"}
execute as @a[tag=mm_be_stunned] at @s run playsound minecraft:block.anvil.place player @s
execute as @a[tag=mm_be_stunned] run scoreboard players set @s mm_stun_tick 100
execute as @a[tag=mm_be_stunned] run clear @s *[minecraft:custom_data={Knife:1}]
execute as @a[tag=mm_be_stunned] run tag @s remove mm_be_stunned

execute as @a[scores={mm_stun_tick=0}] run effect clear @s slowness
execute as @a[scores={mm_stun_tick=0}] run loot replace entity @s hotbar.1 loot mm:knife

execute as @a[scores={mm_stun_tick=0..}] run scoreboard players remove @s mm_stun_tick 1
execute as @a[scores={mm_stun_tick=0..}] run effect give @s slowness 1 4 true

#复活
execute as @a[tag=mm_invincinble] run scoreboard players set @s mm_death_type 0
execute as @a[scores={mm_death_type=1..}] run tag @s remove mm_using_features

##剩余复活次数不少于1
execute as @a[scores={mm_death_type=1..,mm_life=1..}] run tag @s add mm_revive

execute as @a[tag=mm_revive] run tellraw @s {"translate":"mm.text_death_cause_display","color":"red","with":[{"translate":"mm.text_death_cause_display.respawn.super_power","color":"green"}]}
execute as @a[tag=mm_revive] as @a[scores={mm_death_type=..-1}] run tellraw @s {"translate":"mm.text_death_cause_display.respawn.others","color":"red"}
execute as @a[tag=mm_revive] as @a[scores={mm_death_type=..-1}] run scoreboard players set @s mm_death_type 0
execute as @a[tag=mm_revive] run function mm:utils/run_command_at_spawn/main {callback:"function mm:utils/teleport with storage mm:main temporary"}
execute as @a[tag=mm_revive] run scoreboard players remove @s mm_life 1

execute as @a[tag=mm_revive] run scoreboard players set @s mm_death_type 0
execute as @a[tag=mm_revive] run function mm:game/game_module/projectile/remove
execute as @a[tag=mm_revive] run tag @s remove mm_revive

##持有免死金牌
execute as @a[scores={mm_death_type=1..}] if items entity @s container.* *[minecraft:custom_data~{PropGoldMedal:1}] run tag @s add mm_revive

execute as @a[tag=mm_revive] run tellraw @s {"translate":"mm.text_death_cause_display","color":"red","with":[{"translate":"mm.text_death_cause_display.respawn.gold_medal","color":"green"}]}
execute as @a[tag=mm_revive] as @a[scores={mm_death_type=..-1}] run tellraw @s {"translate":"mm.text_death_cause_display.respawn.others","color":"red"}
execute as @a[tag=mm_revive] as @a[scores={mm_death_type=..-1}] run scoreboard players set @s mm_death_type 0
execute as @a[tag=mm_revive] run function mm:utils/run_command_at_spawn/main {callback:"function mm:utils/teleport with storage mm:main temporary"}
execute as @a[tag=mm_revive] run clear @s *[minecraft:custom_data={GoldMedal:1}] 1

execute as @a[tag=mm_revive] run scoreboard players set @s mm_death_type 0
execute as @a[tag=mm_revive] run function mm:game/game_module/projectile/remove
execute as @a[tag=mm_revive] run tag @s remove mm_revive

execute as @a[scores={mm_death_type=1..}] run tag @s add mm_victim

execute as @a[tag=mm_victim] run clear @s minecraft:gold_ingot
execute as @a[tag=mm_victim] run scoreboard players set @s mm_thrown_knife 0

execute as @a[tag=mm_victim] run scoreboard players set @s mm_cd_tick -1
execute as @a[tag=mm_victim] run scoreboard players set @s mm_throw_tick -1
execute as @a[tag=mm_victim] run scoreboard players set @s mm_sc_tick -1

##数据运算
execute as @a[tag=mm_victim] run function mm:scoreboard/calculate_data/main

#死亡原因显示
execute if score death_cause_display mm_settings matches 1 as @a[tag=mm_victim,scores={mm_death_type=1..}] run function mm:game/game_module/death_cause_display/main

#击杀显示
execute as @a[scores={mm_death_type=..-1}] run function mm:game/game_module/kill_display

#遗言计时并消失
execute as @e[tag=mm_lastwords,scores={mm_cd_tick=1..}] run scoreboard players remove @s mm_cd_tick 1
execute as @e[tag=mm_lastwords,scores={mm_cd_tick=0}] run kill @s

#遗体计时并消失
execute as @e[tag=mm_dead_body,scores={mm_cd_tick=1..}] run scoreboard players remove @s mm_cd_tick 1
execute as @e[tag=mm_dead_body,scores={mm_cd_tick=0}] run tp ~ -128 ~
execute as @e[tag=mm_dead_body,scores={mm_cd_tick=0}] run kill @s
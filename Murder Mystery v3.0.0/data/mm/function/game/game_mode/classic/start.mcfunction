#分配身份
scoreboard players set @a[tag=mm_playing] mm_spe_id 0

execute if score special_role_random mm_settings matches 0 run function mm:game/game_module/classic/distribute_roles/weight {index:0}
execute if score special_role_random mm_settings matches 1 run function mm:game/game_module/classic/distribute_roles/random {index:0}

execute if score game_mode mm_main matches 9 run tag @a[tag=mm_playing,tag=!mm_detective,tag=!mm_spectator] add mm_murderer

tag @a[tag=mm_playing,tag=!mm_murderer,tag=!mm_spectator] add mm_innocent
tag @a[tag=mm_murderer] add mm_origin
tag @a[tag=mm_detective] add mm_origin

team join mm_murderer @a[tag=mm_murderer]

function mm:game/game_module/classic/innocent_group

##接口
execute as @a[tag=mm_murderer] run scoreboard players set @s mm_API_p 34
execute as @a[tag=mm_detective] run scoreboard players set @s mm_API_p 39
execute as @a[tag=mm_innocent] run scoreboard players set @s mm_API_p 42

execute as @a[tag=mm_murderer] run loot replace entity @s container.35 loot mm:name
execute as @a[tag=mm_murderer,scores={mm_spe_id=1}] run data modify storage mm:main game.Murderer1 set value {Name:'',Kills:0}
execute as @a[tag=mm_murderer,scores={mm_spe_id=1}] run data modify storage mm:main game.Murderer1.Name set from entity @s Inventory[{Slot:35b}].components."minecraft:custom_name"
execute as @a[tag=mm_murderer,scores={mm_spe_id=2}] run data modify storage mm:main game.Murderer2 set value {Name:'',Kills:0}
execute as @a[tag=mm_murderer,scores={mm_spe_id=2}] run data modify storage mm:main game.Murderer2.Name set from entity @s Inventory[{Slot:35b}].components."minecraft:custom_name"
execute as @a[tag=mm_murderer] run clear @s *[minecraft:custom_data={Name:1}]

execute as @a[tag=mm_detective] run loot replace entity @s container.35 loot mm:name
execute as @a[tag=mm_detective,scores={mm_spe_id=1}] run data modify storage mm:main game.Detective1 set value {Name:'',Kills:0}
execute as @a[tag=mm_detective,scores={mm_spe_id=1}] run data modify storage mm:main game.Detective1.Name set from entity @s Inventory[{Slot:35b}].components."minecraft:custom_name"
execute as @a[tag=mm_detective,scores={mm_spe_id=2}] run data modify storage mm:main game.Detective2 set value {Name:'',Kills:0}
execute as @a[tag=mm_detective,scores={mm_spe_id=2}] run data modify storage mm:main game.Detective2.Name set from entity @s Inventory[{Slot:35b}].components."minecraft:custom_name"
execute as @a[tag=mm_detective] run clear @s *[minecraft:custom_data={Name:1}]

#道具模式说明
execute if score game_mode mm_main matches 5 run tellraw @a[tag=mm_playing] {"text":"=============================================","color":"green"}
execute if score game_mode mm_main matches 5 run tellraw @a[tag=mm_playing] [{"text":"§e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e "},{"translate":"mm.text.game_mode.prop","bold":true}]
execute if score game_mode mm_main matches 5 run tellraw @a[tag=mm_playing] [{"text":"§e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e "},{"translate":"mm.text.game_mode.prop.description","color":"yellow"}]
execute if score game_mode mm_main matches 5 run tellraw @a[tag=mm_playing] {"text":"=============================================","color":"green"}

#道具双倍模式说明
execute if score game_mode mm_main matches 8 run tellraw @a[tag=mm_playing] {"text":"=============================================","color":"green"}
execute if score game_mode mm_main matches 8 run tellraw @a[tag=mm_playing] [{"text":"§e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e "},{"translate":"mm.text.game_mode.prop_double_up","bold":true}]
execute if score game_mode mm_main matches 8 run tellraw @a[tag=mm_playing] [{"text":"§e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e "},{"translate":"mm.text.game_mode.prop.description","color":"yellow"}]
execute if score game_mode mm_main matches 8 run tellraw @a[tag=mm_playing] {"text":"=============================================","color":"green"}

#大爹模式说明
execute if score game_mode mm_main matches 9 run tellraw @a[tag=mm_playing] {"text":"=============================================","color":"green"}
execute if score game_mode mm_main matches 9 run tellraw @a[tag=mm_playing] [{"text":"§e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e "},{"translate":"mm.text.game_mode.boss","bold":true}]
execute if score game_mode mm_main matches 9 run tellraw @a[tag=mm_playing] [{"text":"§e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e "},{"translate":"mm.text.game_mode.boss.description.1","color":"yellow"}]
execute if score game_mode mm_main matches 9 run tellraw @a[tag=mm_playing] [{"text":"§e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e "},{"translate":"mm.text.game_mode.boss.description.2","color":"yellow"}]
execute if score game_mode mm_main matches 9 run tellraw @a[tag=mm_playing] {"text":"=============================================","color":"green"}

#显示标题
execute unless score murderer_count mm_settings matches 2.. run title @a[tag=mm_murderer] subtitle {"translate":"mm.title.murderer.subtitle.classic","color":"yellow"}
execute if score murderer_count mm_settings matches 2.. run title @a[tag=mm_murderer] subtitle {"translate":"mm.title.murderer.subtitle.double_up","color":"yellow"}
title @a[tag=mm_murderer] title {"translate":"mm.title.murderer","color":"red"}
execute as @a[tag=mm_murderer] at @s run playsound minecraft:entity.elder_guardian.curse player @s ~ ~ ~ 1 1

execute unless score murderer_count mm_settings matches 2.. run title @a[tag=mm_detective] subtitle {"translate":"mm.title.detective.subtitle.classic","color":"yellow"}
execute if score murderer_count mm_settings matches 2.. run title @a[tag=mm_detective] subtitle {"translate":"mm.title.detective.subtitle.double_up","color":"yellow"}
title @a[tag=mm_detective] title {"translate":"mm.title.detective","color":"aqua"}
execute as @a[tag=mm_detective] at @s run playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1 1

title @a[tag=mm_innocent,tag=!mm_detective] subtitle {"translate":"mm.title.innocent.subtitle","color":"yellow"}
title @a[tag=mm_innocent,tag=!mm_detective] title {"translate":"mm.title.innocent","color":"green"}
execute as @a[tag=mm_innocent,tag=!mm_detective] at @s run playsound minecraft:entity.villager.ambient player @s ~ ~ ~ 1 1

execute unless score game_mode mm_main matches 9 if score murderer_count mm_settings matches 2.. run tellraw @a[tag=mm_murderer] ""
execute unless score game_mode mm_main matches 9 if score murderer_count mm_settings matches 2.. run tellraw @a[tag=mm_murderer,scores={mm_spe_id=1}] [{"text":"§e §e §e §e §e "},{"translate":"mm.text.murderer_group","color":"gray","with":[{"selector":"@a[tag=mm_murderer,scores={mm_spe_id=2}]","color":"gray"}]}]
execute unless score game_mode mm_main matches 9 if score murderer_count mm_settings matches 2.. run tellraw @a[tag=mm_murderer,scores={mm_spe_id=2}] [{"text":"§e §e §e §e §e "},{"translate":"mm.text.murderer_group","color":"gray","with":[{"selector":"@a[tag=mm_murderer,scores={mm_spe_id=1}]","color":"gray"}]}]
execute unless score game_mode mm_main matches 9 if score murderer_count mm_settings matches 2.. run tellraw @a[tag=mm_murderer] [{"text":"§e §e §e §e §e §e §e §e §e §e §e §e "},{"translate":"mm.text.murderer_group.tip","color":"gray","with":[{"translate":"mm.text.murderer_group.tip.not","color":"red","bold":true}]}]
execute unless score game_mode mm_main matches 9 if score murderer_count mm_settings matches 2.. run tellraw @a[tag=mm_murderer] [{"text":"§e §e §e §e §e §e "},{"translate":"mm.text.murderer_group.message","color":"gray","with":[{"text":"/teammsg","color":"gold"}]}]
execute unless score game_mode mm_main matches 9 if score murderer_count mm_settings matches 2.. run tellraw @a[tag=mm_murderer] ""

execute if score murderer_count mm_settings matches 2.. run tellraw @a[tag=mm_detective] ""
execute if score murderer_count mm_settings matches 2.. run tellraw @a[tag=mm_detective,scores={mm_spe_id=1}] [{"text":"§e §e §e §e §e "},{"translate":"mm.text.detective_group","color":"gray","with":[{"selector":"@a[tag=mm_detective,scores={mm_spe_id=2}]","color":"gray"}]}]
execute if score murderer_count mm_settings matches 2.. run tellraw @a[tag=mm_detective,scores={mm_spe_id=2}] [{"text":"§e §e §e §e §e "},{"translate":"mm.text.detective_group","color":"gray","with":[{"selector":"@a[tag=mm_detective,scores={mm_spe_id=1}]","color":"gray"}]}]
execute if score murderer_count mm_settings matches 2.. run tellraw @a[tag=mm_detective] ""

#成为侦探几率重置
execute as @a[tag=mm_detective] run scoreboard players set @s mm_d_chance 1

#数据运算
function mm:scoreboard/calculate_data/main
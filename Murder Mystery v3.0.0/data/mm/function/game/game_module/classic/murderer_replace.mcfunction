#随机平民成为新杀手
tag @a[tag=mm_innocent,tag=!mm_detective,limit=1] add mm_murderer_replace

execute unless entity @a[tag=mm_murderer_replace] run return 0

scoreboard players set @a[tag=mm_murderer] mm_API_p 70
tellraw @a[tag=mm_murderer] {"translate":"mm.text.murderer_replace.fellow","color":"green"}

execute as @a[tag=mm_murderer_replace] run tag @s remove mm_innocent
execute as @a[tag=mm_murderer_replace] run tag @s add mm_murderer
execute as @a[tag=mm_murderer_replace] run tag @s add mm_origin
execute as @a[tag=mm_murderer_replace] run team join mm_murderer @s
execute as @a[tag=mm_murderer_replace] unless entity @a[tag=mm_murderer,scores={mm_spe_id=1}] run scoreboard players set @s mm_spe_id 1
execute as @a[tag=mm_murderer_replace] unless entity @a[tag=mm_murderer,scores={mm_spe_id=2}] run scoreboard players set @s mm_spe_id 2
execute as @a[tag=mm_murderer_replace] run scoreboard players set @s mm_API_p 69

execute as @a[tag=mm_murderer_replace] run loot replace entity @s container.35 loot mm:name
execute as @a[tag=mm_murderer_replace,scores={mm_spe_id=1}] run data modify storage mm:main game.Murderer1 set value {Name:'',Kills:0}
execute as @a[tag=mm_murderer_replace,scores={mm_spe_id=1}] run data modify storage mm:main game.Murderer1.Name set from entity @s Inventory[{Slot:35b}].components."minecraft:custom_name"
execute as @a[tag=mm_murderer_replace,scores={mm_spe_id=2}] run data modify storage mm:main game.Murderer2 set value {Name:'',Kills:0}
execute as @a[tag=mm_murderer_replace,scores={mm_spe_id=2}] run data modify storage mm:main game.Murderer2.Name set from entity @s Inventory[{Slot:35b}].components."minecraft:custom_name"
execute as @a[tag=mm_murderer_replace] run clear @s *[minecraft:custom_data={Name:1}]

function mm:scoreboard/calculate_data/main

execute as @a[tag=mm_murderer_replace] run tellraw @s {"translate":"mm.text.murderer_replace.self","color":"green"}
execute unless score murderer_count mm_settings matches 2.. as @a[tag=mm_murderer_replace] run title @s subtitle {"translate":"mm.title.murderer.description.classic","color":"yellow"}
execute if score murderer_count mm_settings matches 2.. as @a[tag=mm_murderer_replace] run title @s subtitle {"translate":"mm.title.murderer.description.double_up","color":"yellow"}
execute as @a[tag=mm_murderer_replace] run title @s title {"translate":"mm.title.murderer","color":"red"}
execute as @a[tag=mm_murderer_replace] at @s run playsound minecraft:entity.elder_guardian.curse player @s ~ ~ ~ 1 1

execute if score murderer_count mm_settings matches 2.. run tellraw @a[tag=mm_murderer] ""
execute if score murderer_count mm_settings matches 2.. run tellraw @a[tag=mm_murderer,scores={mm_spe_id=1}] [{"text":"§e §e §e §e §e "},{"translate":"mm.text.murderer_group","color":"gray","with":[{"selector":"@a[tag=mm_murderer,scores={mm_spe_id=2}]","color":"gray"}]}]
execute if score murderer_count mm_settings matches 2.. run tellraw @a[tag=mm_murderer,scores={mm_spe_id=2}] [{"text":"§e §e §e §e §e "},{"translate":"mm.text.murderer_group","color":"gray","with":[{"selector":"@a[tag=mm_murderer,scores={mm_spe_id=1}]","color":"gray"}]}]
execute if score murderer_count mm_settings matches 2.. run tellraw @a[tag=mm_murderer] [{"text":"§e §e §e §e §e §e §e §e §e §e §e §e "},{"translate":"mm.text.murderer_group.tip","color":"gray","with":[{"translate":"mm.text.murderer_group.tip.not","color":"red","bold":true}]}]
execute if score murderer_count mm_settings matches 2.. run tellraw @a[tag=mm_murderer] [{"text":"§e §e §e §e §e §e "},{"translate":"mm.text.murderer_group.message","color":"gray","with":[{"text":"/teammsg","color":"gold"}]}]
execute if score murderer_count mm_settings matches 2.. run tellraw @a[tag=mm_murderer] ""

execute as @a[tag=mm_murderer_replace] run tag @s remove mm_murderer_replace
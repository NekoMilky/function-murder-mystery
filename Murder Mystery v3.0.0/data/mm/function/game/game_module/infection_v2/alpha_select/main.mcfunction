execute as @a[tag=mm_alpha] run tag @s remove mm_survivor
execute as @a[tag=mm_alpha] run tag @s add mm_invincible
execute as @a[tag=mm_alpha] run scoreboard players set @s mm_API_p 57

title @a[tag=mm_alpha] subtitle {"translate":"mm.title.alpha.subtitle","color":"yellow"}
title @a[tag=mm_alpha] title {"translate":"mm.title.alpha","color":"red"}
execute as @a[tag=mm_alpha] at @s run playsound minecraft:block.respawn_anchor.set_spawn player @s ~ ~ ~ 1 1

title @a[tag=mm_survivor] subtitle {"translate":"mm.title.survivor.subtitle.infection","color":"yellow"}
title @a[tag=mm_survivor] title {"translate":"mm.title.survivor","color":"green"}
execute as @a[tag=mm_survivor] at @s run playsound minecraft:item.armor.equip_iron player @s ~ ~ ~ 1 1

execute as @a[tag=mm_alpha] run loot replace entity @s hotbar.0 loot mm:bow
execute as @a[tag=mm_alpha] run loot replace entity @s hotbar.1 loot mm:knife
execute as @a[tag=mm_alpha] run loot replace entity @s armor.chest loot mm:chestplate
execute as @a[tag=mm_alpha] run loot replace entity @s container.35 loot mm:name
execute as @a[tag=mm_alpha] run data modify storage mm:main game.Alpha set value {Name:'',Kills:0}
execute as @a[tag=mm_alpha] run data modify storage mm:main game.Alpha.Name set from entity @s Inventory[{Slot:35b}].components."minecraft:custom_name"
execute as @a[tag=mm_alpha] run clear @s *[minecraft:custom_data={Name:1}]

tellraw @a[tag=mm_survivor] {"translate":"mm.text.alpha_select.others","color":"yellow","with":[{"translate":"mm.text.alpha_select.others.care","color":"red"}]}
tellraw @a[tag=mm_alpha] {"translate":"mm.text.alpha_select.self","color":"yellow","with":[{"translate":"mm.text.alpha_select.self.alpha","color":"red","bold":true}]}
tellraw @a[tag=mm_alpha] {"translate":"mm.text.alpha_select.self.invincible","color":"green"}

execute as @a[tag=mm_survivor] run loot replace entity @s hotbar.0 loot mm:bow
execute as @a[tag=mm_survivor] run item replace entity @s hotbar.1 with minecraft:arrow 32
execute as @a[tag=mm_survivor] run scoreboard players set @s mm_API_p 47

execute as @a[tag=mm_survivor] run scoreboard players operation @s mm_a_chance += @s mm_chance_amp
execute as @a[tag=mm_alpha] run scoreboard players set @s mm_a_chance 1

scoreboard players set infected_tick mm_main 600
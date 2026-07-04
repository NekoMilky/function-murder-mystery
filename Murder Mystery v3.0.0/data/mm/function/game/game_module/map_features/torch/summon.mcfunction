execute at @s if block ~ ~ ~ #minecraft:air if block ~ ~-1 ~ #mm:combustible_block run summon armor_stand ~ ~-1 ~ {Small:1,Invisible:1,NoGravity:1,Tags:["mm_torch","mm_new"]}
execute at @s as @e[tag=mm_torch,tag=mm_new] at @s run function mm:game/game_module/map_features/torch/fire

execute at @s as @p[tag=mm_right_click,tag=!mm_spectator,tag=!mm_dead,scores={mm_torch_tick=0}] if items entity @s weapon.mainhand *[minecraft:custom_data~{Torch:1}] run tag @s add mm_use_torch

execute as @a[tag=mm_use_torch] run scoreboard players set @s mm_API_p 83
execute as @a[tag=mm_use_torch] at @s run playsound minecraft:block.fire.ambient block @a ~ ~ ~ 1.25 1
execute as @a[tag=mm_use_torch] run tellraw @s {"translate":"mm.text.map_features.torch.use","color":"green"}
execute as @a[tag=mm_use_torch] store result score @s mm_torch_tick run function mm:utils/get_value_in_inventory {search_tags:"Torch:1",target_tag:"Cooldown"}
execute as @a[tag=mm_use_torch] run function mm:utils/clear_with_tag {item_tag:"Torch",max_count:1}

execute as @a[tag=mm_use_torch] run tag @s remove mm_use_torch
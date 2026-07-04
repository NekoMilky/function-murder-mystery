execute at @s run summon minecraft:snow_golem ~ ~ ~ {Tags:["mm_snowman","mm_new"],Invulnerable:1}

execute at @s as @p[tag=mm_right_click,tag=!mm_spectator,tag=!mm_dead,scores={mm_snowman_tick=0}] if items entity @s weapon.mainhand *[minecraft:custom_data~{Snowman:1}] run tag @s add mm_summon_snowman

execute as @a[tag=mm_summon_snowman] run scoreboard players set @s mm_API_p 80
execute as @a[tag=mm_summon_snowman] at @s run playsound minecraft:block.stone.place block @a ~ ~ ~ 1.25 1
execute as @a[tag=mm_summon_snowman] run tellraw @s {"translate":"mm.text.map_features.snowman.place","color":"green"}
execute as @a[tag=mm_summon_snowman] store result score @s mm_snowman_tick run function mm:utils/get_value_in_inventory {search_tags:"Snowman:1",target_tag:"Cooldown"}
execute as @a[tag=mm_summon_snowman] run function mm:utils/clear_with_tag {item_tag:"Snowman",max_count:1}

execute as @a[tag=mm_summon_snowman] run tag @s remove mm_summon_snowman
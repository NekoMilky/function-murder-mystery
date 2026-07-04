execute at @s if entity @s[tag=mm_web_start,tag=mm_south_north] run tp @s ~ ~ ~ 0 0
execute at @s if entity @s[tag=mm_web_start,tag=mm_east_west] run tp @s ~ ~ ~ 90 0

execute at @s if block ^ ^ ^ #minecraft:air run summon armor_stand ^ ^ ^ {Small:1,Invisible:1,NoGravity:1,Tags:["mm_web","mm_new"]}
execute at @s if block ^ ^ ^1 #minecraft:air run summon armor_stand ^ ^ ^1 {Small:1,Invisible:1,NoGravity:1,Tags:["mm_web","mm_new"]}
execute at @s if block ^ ^ ^-1 #minecraft:air run summon armor_stand ^ ^ ^-1 {Small:1,Invisible:1,NoGravity:1,Tags:["mm_web","mm_new"]}
execute at @s if block ^1 ^ ^ #minecraft:air run summon armor_stand ^1 ^ ^ {Small:1,Invisible:1,NoGravity:1,Tags:["mm_web","mm_new"]}
execute at @s if block ^1 ^ ^1 #minecraft:air run summon armor_stand ^1 ^ ^1 {Small:1,Invisible:1,NoGravity:1,Tags:["mm_web","mm_new"]}
execute at @s if block ^1 ^ ^-1 #minecraft:air run summon armor_stand ^1 ^ ^-1 {Small:1,Invisible:1,NoGravity:1,Tags:["mm_web","mm_new"]}
execute at @s if block ^-1 ^ ^ #minecraft:air run summon armor_stand ^-1 ^ ^ {Small:1,Invisible:1,NoGravity:1,Tags:["mm_web","mm_new"]}
execute at @s if block ^-1 ^ ^1 #minecraft:air run summon armor_stand ^-1 ^ ^1 {Small:1,Invisible:1,NoGravity:1,Tags:["mm_web","mm_new"]}
execute at @s if block ^-1 ^ ^-1 #minecraft:air run summon armor_stand ^-1 ^ ^-1 {Small:1,Invisible:1,NoGravity:1,Tags:["mm_web","mm_new"]}

execute at @s as @p[tag=mm_right_click,tag=!mm_spectator,tag=!mm_dead,scores={mm_web_tick=0}] if items entity @s weapon.mainhand *[minecraft:custom_data~{Web:1}] run tag @s add mm_use_web

execute as @a[tag=mm_use_web] run scoreboard players set @s mm_API_p 94
execute as @a[tag=mm_use_web] at @s run playsound minecraft:block.stone.place block @a ~ ~ ~ 1.25 1
execute as @a[tag=mm_use_web] run tellraw @s {"translate":"mm.text.map_features.web.place","color":"green"}
execute as @a[tag=mm_use_web] store result score @s mm_web_tick run function mm:utils/get_value_in_inventory {search_tags:"Web:1",target_tag:"Cooldown"}
execute as @a[tag=mm_use_web] run function mm:utils/clear_with_tag {item_tag:"Web",max_count:1}

execute as @a[tag=mm_use_web] run tag @s remove mm_use_web
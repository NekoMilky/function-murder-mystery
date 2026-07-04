#仍在冷却
execute as @s[tag=mm_triggered_machine,scores={mm_monorail_tick=1..}] at @s if entity @n[tag=mm_triggered,distance=..5] run tellraw @s {"translate":"mm.text.map_features.monorail.cooldown","color":"red"}
execute as @s[tag=mm_triggered_machine,scores={mm_monorail_tick=1..}] at @s if entity @n[tag=mm_triggered,distance=..5] run playsound minecraft:block.anvil.place player @s
execute as @s[tag=mm_triggered_machine,scores={mm_monorail_tick=1..}] at @s if entity @n[tag=mm_triggered,distance=..5] run scoreboard players set @s mm_API_p 72

execute as @s[tag=mm_triggered_machine,scores={mm_monorail_tick=1..}] at @s run tag @n[tag=mm_triggered,distance=..5] remove mm_triggered
execute as @s[tag=mm_triggered_machine,scores={mm_monorail_tick=1..}] run tag @s remove mm_triggered_machine

#金锭不足
execute as @s[tag=mm_triggered_machine] store result score this_gold_ingot_count mm_main run function mm:utils/get_count_in_inventory {id:"gold_ingot"}
execute as @s[tag=mm_triggered_machine] if score this_gold_ingot_count mm_main < cost_value mm_main run tellraw @s {"translate":"mm.text.buy_fail.no_enough_gold","color":"red","with":[{"score":{"name":"cost_value","objective":"mm_main"},"color":"red"}]}
execute as @s[tag=mm_triggered_machine] if score this_gold_ingot_count mm_main < cost_value mm_main at @s run playsound minecraft:block.anvil.place player @s
execute as @s[tag=mm_triggered_machine] if score this_gold_ingot_count mm_main < cost_value mm_main run scoreboard players set @s mm_API_p 72

execute as @s[tag=mm_triggered_machine] if score this_gold_ingot_count mm_main < cost_value mm_main at @s run tag @n[tag=mm_triggered,distance=..5] remove mm_triggered
execute as @s[tag=mm_triggered_machine] if score this_gold_ingot_count mm_main < cost_value mm_main run tag @s remove mm_triggered_machine

#可发车
execute as @s[tag=mm_triggered_machine] run scoreboard players set @s mm_API_p 73
execute as @s[tag=mm_triggered_machine] run tellraw @s {"translate":"mm.text.map_features.monorail.start","color":"green"}
execute as @a[tag=mm_triggered_machine] run data modify storage mm:main temporary.id set value "gold_ingot"
execute as @a[tag=mm_triggered_machine] store result storage mm:main temporary.max_count int 1 run scoreboard players get cost_value mm_main
execute as @a[tag=mm_triggered_machine] run function mm:utils/clear with storage mm:main temporary
execute as @s[tag=mm_triggered_machine] run tag @s add mm_using_features

execute as @s[tag=mm_triggered_machine] at @s at @n[tag=mm_triggered,distance=..5] if block ~1 ~ ~ powered_rail run summon minecart ~1 ~ ~ {Tags:["mm_monorail"],Invulnerable:1} 
execute as @s[tag=mm_triggered_machine] at @s at @n[tag=mm_triggered,distance=..5] if block ~-1 ~ ~ powered_rail run summon minecart ~-1 ~ ~ {Tags:["mm_monorail"],Invulnerable:1} 
execute as @s[tag=mm_triggered_machine] at @s at @n[tag=mm_triggered,distance=..5] if block ~ ~ ~1 powered_rail run summon minecart ~ ~ ~1 {Tags:["mm_monorail"],Invulnerable:1} 
execute as @s[tag=mm_triggered_machine] at @s at @n[tag=mm_triggered,distance=..5] if block ~ ~ ~-1 powered_rail run summon minecart ~ ~ ~-1 {Tags:["mm_monorail"],Invulnerable:1} 
execute as @s[tag=mm_triggered_machine] at @s at @n[tag=mm_triggered,distance=..5] if block ~ ~1 ~ powered_rail run summon minecart ~ ~1 ~ {Tags:["mm_monorail"],Invulnerable:1} 
execute as @s[tag=mm_triggered_machine] at @s at @n[tag=mm_triggered,distance=..5] if block ~ ~-1 ~ powered_rail run summon minecart ~ ~-1 ~ {Tags:["mm_monorail"],Invulnerable:1} 

execute as @s[tag=mm_triggered_machine] at @s run tag @n[tag=mm_triggered,distance=..5] remove mm_triggered
execute as @s[tag=mm_triggered_machine] run tag @s remove mm_triggered_machine
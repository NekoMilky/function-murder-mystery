execute at @s run tag @p[tag=mm_playing,tag=!mm_dead,tag=!mm_spectator,distance=..5,scores={mm_button=1..}] add mm_pressed

#尝试购买
execute store result score cost_value mm_main run data get entity @s equipment.feet.components."minecraft:custom_data".Cost
execute store result score count_value mm_main run data get entity @s equipment.feet.components."minecraft:custom_data".Count
execute store result score cooldown_value mm_main run data get entity @s equipment.feet.components."minecraft:custom_data".Cooldown
execute at @s as @p[tag=mm_pressed] store result score this_gold_ingot_count mm_main run function mm:utils/get_count_in_inventory {id:"gold_ingot"}

#已有物品
$execute at @s if items entity @p[tag=mm_pressed] container.* *[minecraft:custom_data~{$(item_tag):1}] run tag @s add mm_refused

execute as @s[tag=mm_refused] as @a[tag=mm_pressed] at @s run playsound minecraft:block.anvil.place player @s
execute as @s[tag=mm_refused] as @a[tag=mm_pressed] run tellraw @s {"translate":"mm.text.buy_fail.already_bought","color":"red"}
$execute as @s[tag=mm_refused] as @a[tag=mm_pressed] run scoreboard players set @s mm_API_p $(fail_api)

#金锭不足
execute as @s[tag=!mm_refused] if score this_gold_ingot_count mm_main < cost_value mm_main run tag @s add mm_failed

execute as @s[tag=mm_failed] as @a[tag=mm_pressed] at @s run playsound minecraft:block.anvil.place player @s
execute as @s[tag=mm_failed] as @a[tag=mm_pressed] run tellraw @s {"translate":"mm.text.buy_fail.no_enough_gold","color":"red","with":[{"score":{"name":"cost_value","objective":"mm_main"},"color":"red"}]}
$execute as @s[tag=mm_failed] as @a[tag=mm_pressed] run scoreboard players set @s mm_API_p $(fail_api)

#购买成功
execute as @s[tag=!mm_refused,tag=!mm_failed] run tag @s add mm_triggered
execute as @s[tag=!mm_refused,tag=!mm_failed,tag=mm_triggered] at @s run tag @p[tag=mm_pressed] add mm_triggered_machine

$execute as @a[tag=mm_triggered_machine] run function mm:game/game_module/map_features/$(name)/trigger_machine

$execute as @a[tag=mm_triggered_machine] run scoreboard players set @s mm_API_p $(success_api)
$execute as @a[tag=mm_triggered_machine] run tellraw @s {"translate":"mm.text.buy_success","color":"green","with":[{"translate":"mm.text_settings.map.map_features.$(name)","color":"green"}]}
execute as @a[tag=mm_triggered_machine] run data modify storage mm:main temporary.id set value "gold_ingot"
execute as @a[tag=mm_triggered_machine] store result storage mm:main temporary.max_count int 1 run scoreboard players get cost_value mm_main
execute as @a[tag=mm_triggered_machine] run function mm:utils/clear with storage mm:main temporary

$execute as @a[tag=mm_triggered_machine] run function mm:game/game_module/map_features/common/search_empty_slot {slot:0,name:$(name),item_tag:$(item_tag)}

execute as @s[tag=mm_triggered] run tag @s remove mm_triggered
execute as @s[tag=mm_refused] run tag @s remove mm_refused
execute as @s[tag=mm_failed] run tag @s remove mm_failed

execute as @a[tag=mm_pressed] run tag @s remove mm_pressed
execute as @a[tag=mm_triggered_machine] run tag @s remove mm_triggered_machine

execute as @s run tag @s remove mm_new_pressed
execute as @s run tag @s add mm_pressed
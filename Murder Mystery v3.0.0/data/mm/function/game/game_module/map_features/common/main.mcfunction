#状态更新
$function mm:game/game_module/map_features/common/status_update {name:$(name)}

#按下按钮
$execute as @e[tag=mm_$(name)_spawner,tag=mm_special_element,tag=mm_new_pressed] run function mm:game/game_module/map_features/common/new_pressed {name:$(name),fail_api:$(fail_api),success_api:$(success_api),item_tag:$(item_tag)}
$execute as @e[tag=mm_$(name)_spawner,tag=mm_special_element,tag=mm_npc] at @s if entity @a[scores={mm_button=2},tag=mm_playing,tag=!mm_dead,tag=!mm_spectator,tag=!mm_will_respawn,distance=..5] run function mm:game/game_module/map_features/common/new_pressed {name:$(name),fail_api:$(fail_api),success_api:$(success_api),item_tag:$(item_tag)}

#冷却计时
$execute as @a[tag=mm_playing,tag=!mm_spectator,tag=!mm_dead,scores={mm_$(name)_tick=1..}] run scoreboard players remove @s mm_$(name)_tick 1

#使用
$execute as @a[tag=mm_playing,tag=mm_using_features,tag=mm_right_click,tag=!mm_spectator,tag=!mm_dead] if items entity @s weapon.mainhand *[minecraft:custom_data~{$(item_tag):1}] at @s run playsound minecraft:block.anvil.place player @s
$execute as @a[tag=mm_playing,tag=mm_using_features,tag=mm_right_click,tag=!mm_spectator,tag=!mm_dead] if items entity @s weapon.mainhand *[minecraft:custom_data~{$(item_tag):1}] run tellraw @s {"translate":"mm.feedback.cant_use_this_now","color":"red"}

$execute as @a[tag=mm_playing,tag=mm_right_click,tag=!mm_spectator,tag=!mm_dead,scores={mm_$(name)_tick=1..}] if items entity @s weapon.mainhand *[minecraft:custom_data~{$(item_tag):1}] at @s run playsound minecraft:block.anvil.place player @s
$execute as @a[tag=mm_playing,tag=mm_right_click,tag=!mm_spectator,tag=!mm_dead,scores={mm_$(name)_tick=1..}] if items entity @s weapon.mainhand *[minecraft:custom_data~{$(item_tag):1}] run tellraw @s {"translate":"mm.feedback.cooldown","color":"red"}

$execute as @a[tag=mm_playing,tag=!mm_using_features,tag=mm_right_click,tag=!mm_spectator,tag=!mm_dead,scores={mm_$(name)_tick=0}] if items entity @s weapon.mainhand *[minecraft:custom_data~{$(item_tag):1}] at @s run function mm:game/game_module/map_features/$(name)/use
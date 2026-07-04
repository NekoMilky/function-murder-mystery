#状态更新
function mm:game/game_module/map_features/common/main {name:"mars_potion",item_tag:"MarsPotion",fail_api:89,success_api:90}

#检测喝药
execute as @a[tag=!mm_no_effect,tag=!mm_spectator,tag=!mm_dead,tag=mm_potion] if items entity @s weapon.mainhand *[minecraft:custom_data~{MarsPotion:1}] run tag @s add mm_drink_failed

execute as @a[tag=mm_drink_failed] run tellraw @s {"translate":"mm.text.only_one_effect","color":"red"}
execute as @a[tag=mm_drink_failed] at @s run playsound minecraft:block.anvil.place player @s
execute as @a[tag=mm_drink_failed] run clear @s glass_bottle
execute as @a[tag=mm_drink_failed] run function mm:game/game_module/map_features/common/search_empty_slot {slot:0,name:"mars_potion",item_tag:"MarsPotion"}

execute as @a[tag=mm_no_effect,tag=!mm_spectator,tag=!mm_dead,tag=mm_potion] if items entity @s weapon.mainhand *[minecraft:custom_data~{MarsPotion:1}] run tag @s add mm_drink_success

execute as @a[tag=mm_drink_success] run scoreboard players set @s mm_API_p 91
execute as @a[tag=mm_drink_success] run tellraw @s {"translate":"mm.text.map_features.mars_potion.drink","color":"green"}
execute as @a[tag=mm_drink_success] run clear @s glass_bottle
execute as @a[tag=mm_drink_success] run function mm:utils/clear_with_tag {item_tag:"MarsPotion",max_count:1}
execute as @a[tag=mm_drink_success] run effect give @s jump_boost 30 2 true

execute as @a[tag=mm_drink_failed] run tag @s remove mm_drink_failed
execute as @a[tag=mm_drink_success] run tag @s remove mm_drink_success
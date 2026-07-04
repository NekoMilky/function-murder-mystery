$scoreboard players set @s mm_players_id $(prop_number)

$execute as @s[scores={mm_players_id=1..2}] run data modify entity @s CustomName set value {"translate":"mm.text_settings.play.mode_features.prop_enable.$(prop_number)","color":"green","bold":true}
$execute as @s[scores={mm_players_id=3..6}] run data modify entity @s CustomName set value {"translate":"mm.text_settings.play.mode_features.prop_enable.$(prop_number)","color":"blue","bold":true}
$execute as @s[scores={mm_players_id=7..10}] run data modify entity @s CustomName set value {"translate":"mm.text_settings.play.mode_features.prop_enable.$(prop_number)","color":"dark_purple","bold":true}
$execute as @s[scores={mm_players_id=11..12}] run data modify entity @s CustomName set value {"translate":"mm.text_settings.play.mode_features.prop_enable.$(prop_number)","color":"gold","bold":true}

execute as @s[scores={mm_players_id=1..2}] run data modify entity @s equipment.head set value {id:"minecraft:stone",count:1}
execute as @s[scores={mm_players_id=3..6}] run data modify entity @s equipment.head set value {id:"minecraft:iron_block",count:1}
execute as @s[scores={mm_players_id=7..10}] run data modify entity @s equipment.head set value {id:"minecraft:diamond_block",count:1}
execute as @s[scores={mm_players_id=11..12}] run data modify entity @s equipment.head set value {id:"minecraft:gold_block",count:1}
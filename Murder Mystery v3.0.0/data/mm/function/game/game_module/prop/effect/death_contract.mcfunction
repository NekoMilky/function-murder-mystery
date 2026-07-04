effect give @s speed 15 2 true
tag @s remove mm_complete_de_con
scoreboard players set @s mm_de_con_tick 300

tellraw @s {"translate":"mm.text.prop.active.self","color":"green","with":[{"translate":"mm.text_settings.play.mode_features.prop_enable.10","color":"dark_purple","bold":true},{"translate":"mm.text.prop.10.active","color":"green"}]}
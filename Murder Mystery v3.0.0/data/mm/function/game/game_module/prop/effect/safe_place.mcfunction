function mm:utils/teleport_to_spawn_waiting/main
scoreboard players set @s mm_safe_tick 600

tellraw @s {"translate":"mm.text.prop.active.self","color":"green","with":[{"translate":"mm.text_settings.play.mode_features.prop_enable.9","color":"dark_purple","bold":true},{"translate":"mm.text.prop.9.active","color":"green"}]}
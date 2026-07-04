$scoreboard players set $(scoreboard_name) mm_settings $(value)

$execute if score $(scoreboard_name) mm_settings matches 1 run tellraw @s {"translate":"mm.feedback.set.success","color":"yellow","with":[{"translate":"mm.text_settings.play.$(name)"},{"translate":"mm.text.enable","color":"green"}]}
$execute if score $(scoreboard_name) mm_settings matches 0 run tellraw @s {"translate":"mm.feedback.set.success","color":"yellow","with":[{"translate":"mm.text_settings.play.$(name)"},{"translate":"mm.text.disable","color":"red"}]}
$scoreboard players set this_index mm_main $(index)

$execute if score this_index mm_main matches 0 run tellraw @s {"translate":"mm.feedback.select.success","color":"yellow","with":[{"translate":"mm.text_cosmetics.$(name)"},{"translate":"mm.text_cosmetics.random","color":"green"}]}
$execute unless score this_index mm_main matches 0 run tellraw @s {"translate":"mm.feedback.select.success","color":"yellow","with":[{"translate":"mm.text_cosmetics.$(name)"},{"translate":"mm.text_cosmetics.$(name).$(index)","color":"green"}]}